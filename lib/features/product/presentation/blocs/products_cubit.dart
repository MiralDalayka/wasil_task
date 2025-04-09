import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/common/services/shared_prefs/shared_prefs.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../product/data/models/product_model.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/usecases/get_product_usecase.dart';
import '../../domain/entities/sotring_filtering_enums.dart';

part 'products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInit());
  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductEntity> allProducts = List.empty(growable: true);
  bool finishLoading = false;

  // Sorting products by category or price
  void sortProducts({required SortBy sortBy, required bool ascending}) {
    if (sortBy == SortBy.price) {
      productsWatchList.sort(
        (a, b) =>
            ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price),
      );
    } else if (sortBy == SortBy.category) {
      productsWatchList.sort(
        (a, b) =>
            ascending
                ? a.category.compareTo(b.category)
                : b.category.compareTo(a.category),
      );
    }
    emit(ProductsSorted());
  }

  List<ProductEntity> filterProducts({String? category}) {
    emit(ProductsLoading());

    final filteredList =
        (category != null && category.isNotEmpty)
            ? allProducts
                .where((product) => product.category == category)
                .toList()
            : allProducts;
    emit(ProductsFiltered());

    return filteredList;
  }

  Future<void> getProducts() async {
    emit(ProductsLoading());
    try {
      Either<Failure, List<ProductEntity>> res =
          await serviceLocator<GetProductsUsecase>().call(NoParams());
      res.fold(
        (error) {
          logger.e(error);
          logger.e(error.message);
          finishLoading = true;
          emit(ProductsError(message: error.message));
        },
        (data) async {
          allProducts = data;
          await getWatchList();
          finishLoading = true;
          emit(ProductsSuccess());
        },
      );
    } catch (e) {
      logger.f(e.toString());
      emit(ProductsError(message: "Something went wrong"));
    }
  }

  List<ProductEntity> productsWatchList = [];

  Future<List<ProductEntity>> getWatchList() async {
    final savedListJson = SharedPrefs.getString(Constants.productsListKey);

    if (savedListJson.isEmpty) {
      productsWatchList = allProducts.take(4).toList();
    } else {
      try {
        final List<dynamic> jsonList = jsonDecode(savedListJson);
        productsWatchList =
            jsonList.map((element) => ProductModel.fromJson(element)).toList();
      } catch (e) {
        print('Error parsing watchlist: $e');
        productsWatchList = allProducts.take(4).toList();
      }
    }

    _createWatchCheckedList();
    return productsWatchList;
  }

  List<bool> checkedProducts = List.empty(growable: true);

  void _createWatchCheckedList() {
    checkedProducts = List<bool>.filled(
      productsWatchList.length,
      false,
      growable: true,
    );
  }
}

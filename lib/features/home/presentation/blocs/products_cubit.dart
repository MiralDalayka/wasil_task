import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/common/services/shared_prefs/shared_prefs.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/product_model.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_usecase.dart';

part 'products_states.dart';

enum ProductPriceStates { defaultState, positive, negative }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInit());
  static ProductsCubit get(context) => BlocProvider.of(context);

  //? WEBSOCKET SECTION

  late HubConnection hubConnection;

  void startConnection() async {
    try {
      hubConnection =
          HubConnectionBuilder()
              .withUrl('http://104.248.165.230:5000/market-data-hub')
              .withAutomaticReconnect()
              .build();
      hubConnection.onclose(({error}) => print(error.toString()));

      await hubConnection.start();
      _registerListeners();
      _connectToWatchListProducts();
      logger.w('SignalR connection started.');
    } catch (e) {
      logger.e('Error starting SignalR connection: $e');
    }
  }

  void _registerListeners() {
    hubConnection.on('ReceiveMarketData', (message) {});
  }

  //?UnSubscribeToProduct
  //?UnSubscribeToProducts
  void _connectToWatchListProducts() async {
    try {
      await hubConnection.invoke(
        'SubscribeToProducts',
        args: [
          List<String>.generate(
            productsWatchList.length,
            (index) => productsWatchList[index].title,
          ).toList(),
        ],
      );
    } catch (e) {
      logger.e(e.runtimeType);
      logger.e(e.toString());
    }
  }

  // ProductEntity? getOneProduct({
  //   required List<ProductEntity> list,
  //   required String source,
  // }) {
  //   ProductEntity? ProductEntity;
  //   list.map((Product) {
  //     if (Product.name == source) {
  //       ProductEntity = Product;
  //     }
  //   }).toList();
  //   return ProductEntity;
  // }

  //? WEBSOCKET SECTION END

  List<ProductEntity> allProducts = List.empty(growable: true);

  bool finishLoading = false;
  //* API REQUIESTS
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
          setListWithoutWatchListProducts();
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
      productsWatchList = allProducts.take(8).toList();
    } else {
      try {
        final List<dynamic> jsonList = jsonDecode(savedListJson);
        productsWatchList =
            jsonList.map((element) => ProductModel.fromJson(element)).toList();
      } catch (e) {
        print('Error parsing watchlist: $e');
        productsWatchList = allProducts.take(8).toList();
      }
    }

    _createWatchCheckedList();
    return productsWatchList;
  }

  // //? list<bool> with same length as quotes for the editQuotes screen checkboxes. its only purpose is to track which quote is checked for deletion
  List<bool> checkedProducts = List.empty(growable: true);

  //? creates the list with same length as quotes list. Whether fomr API or local.
  void _createWatchCheckedList() {
    checkedProducts = List<bool>.filled(
      productsWatchList.length,
      false,
      growable: true,
    );
  }

  // //? view mode toggles for quotesScreen
  bool isAdvancedViewMode = true;
  void toggleViewModes() {
    isAdvancedViewMode = !isAdvancedViewMode;
    emit(ProductsViewModeChanged());
  }

  // //? re-orders the list and calls _updateUserSortedQuoteList(); to make sure the change persists locally
  // void reOrder({required int oldIndex, required int newIndex}) {
  //   if (newIndex > oldIndex) {
  //     newIndex -= 1;
  //   }
  //   final dynamic item = ProductsWatchList.removeAt(oldIndex);
  //   ProductsWatchList.insert(newIndex, item);
  //   _updateUserSortedWatchList();
  //   emit(ProductsReOrdered());
  // }

  // //? check/uncheck the item in editQuotesScreen.
  // void toggleSelectedProduct({required int ProductUiIndex, required bool value}) {
  //   checkedProducts[ProductUiIndex] = value;
  //   if (value == true) {
  //     itemsToDelete.insert(
  //       itemsToDelete.length,
  //       ProductsWatchList[ProductUiIndex],
  //     );
  //   }
  //   if (value == false) {
  //     itemsToDelete.removeWhere(
  //       (item) => item.ProductId == ProductsWatchList[ProductUiIndex].ProductId,
  //     );
  //   }
  //   emit(ItemCheckToggled());
  // }

  // //? enables/disables delete mode
  // bool isDeleteMode = false;
  // void toggleDeleteMode({bool? forceDisabled = false}) {
  //   if (forceDisabled == true) {
  //     isDeleteMode = false;
  //     emit(deleteModeToggled());
  //     return;
  //   }
  //   isDeleteMode = !isDeleteMode;
  //   emit(deleteModeToggled());
  // }

  // //? List<Quotes> a list with the only purpose of tracking what items are marked for deletion.
  // List<ProductEntity> itemsToDelete = List.empty(growable: true);

  // bool isAllSelected = false;
  // //? function to select/unselect all listView items by looping over the checkedItems list and sets all values to $true
  // void toggleSelectAll() {
  //   isAllSelected = !isAllSelected;

  //   for (int index = 0; index < checkedProducts.length; index++) {
  //     checkedProducts[index] = false;
  //   }
  //   itemsToDelete.clear();
  //   emit(ClearedSelectedItems());

  //   if (isAllSelected) {
  //     for (int index = 0; index < ProductsWatchList.length; index++) {
  //       checkedProducts[index] = true;
  //       itemsToDelete.insert(index, ProductsWatchList[index]);
  //     }
  //     emit(ToggleSelectAll());
  //   }
  // }

  // //? function to delete the items. loops over the itemsToDelete list ${index-1} times and checks to delete from the original main quotes list.
  // //? Calls _createQuotesCheckedList() to match the new length and calls _updateUserSortedQuoteList() for local persistence.
  // void deleteProductsFromWatchList() {
  //   itemsToDelete
  //       .map(
  //         (ProductToDelete) => ProductsWatchList.removeWhere(
  //           (Product) => ProductToDelete.ProductId == Product.ProductId,
  //         ),
  //       )
  //       .toList();
  //   itemsToDelete.clear();
  //   _createWatchCheckedList();
  //   _updateUserSortedWatchList();
  //   emit(ItemDeleted());
  // }

  // //? Updates the list persisted locally user changed $quotes
  // void _updateUserSortedWatchList() {
  //   List<dynamic> tempList =
  //       ProductsWatchList
  //           .map(
  //             (entity) => ProductModel.toMap(entity: entity),
  //           ) // Convert each Product entity to map
  //           .toList(); // Convert to list directly

  //   // Save the updated watchlist to shared preferences
  //   SharedPrefs.setString(
  //     Constants.quotesListKey,
  //     jsonEncode(tempList), // Convert the list to JSON and store it
  //   );
  // }

  //? ADD function section
  // final addProductFieldController = TextEditingController();
  // void clearSearchField() {
  //   addProductFieldController.clear();
  //   emit(FieldStateChanged());
  // }

  // List<ProductGroupEntity> searchList = List.empty(growable: true);
  // void searchOnChanged(String value) {
  //   searchList.clear();

  //   for (var group in ProductGroups) {
  //     // Create temporary list of matching Products in this group
  //     List<ProductEntity> matchingProducts = [];

  //     for (var Product in group.Products) {
  //       if (Product.name?.toLowerCase().contains(value.toLowerCase()) == true) {
  //         matchingProducts.add(Product);
  //       }
  //     }

  //     // If we found any matching Products, create a copy of the group with only matching Products
  //     if (matchingProducts.isNotEmpty) {
  //       // Create a new group with the same properties but empty Products list
  //       ProductGroupEntity filteredGroup = ProductGroupEntity(
  //         ProductsGroupId: group.ProductsGroupId,
  //         parentId: group.parentId,
  //         name: group.name,
  //         createdAt: group.createdAt,
  //         updatedAt: group.updatedAt,
  //         parentName: group.parentName,
  //       );

  //       // Add only the matching Products
  //       filteredGroup.Products.addAll(matchingProducts);

  //       // Add this filtered group to the search results
  //       searchList.add(filteredGroup);
  //     }
  //   }

  //   logger.f(searchList.length);
  //   emit(FieldStateChanged());
  // }

  List<ProductEntity> listWithoutWatchListProducts = List.empty(growable: true);
  void setListWithoutWatchListProducts() {
    final watchListProductIds =
        productsWatchList
            .map((product) => product.id)
            .toSet(); // Set of all Product IDs in the watchlist
    listWithoutWatchListProducts =
        allProducts
            .where(
              (product) => !watchListProductIds.contains(product.id),
            ) // Filter out Products already in the watchlist
            .toList();
  }

  // void removeProductFromSearchList({
  //   required ProductEntity Product,
  //   required int index,
  // }) {
  //   searchList[index].Products.removeWhere(
  //     (item) => item.ProductId == Product.ProductId,
  //   );
  //   emit(RemovedProductFromSearchList());
  // }

  // void addProductToWatchList(ProductEntity Product) {
  //   try {
  //     ProductsWatchList.add(Product);
  //     setListWithoutWatchListProducts();
  //     _updateUserSortedWatchList();
  //     _createWatchCheckedList();
  //     _connectToWatchListProducts();
  //     emit(AddedProduct());
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }
}

import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/features/product/data/data_source/products_remote_data_source.dart';
import 'package:wasil_flutter_task/features/product/domain/entities/product_entity.dart';
import 'package:wasil_flutter_task/features/product/domain/repository/product_repo.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/errors/failures.dart';

class ProductsRepoImpl implements ProductRepo {
  const ProductsRepoImpl();

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final symbols =
          await serviceLocator<ProductsRemoteDataSource>().getProducts();
      return right(symbols);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

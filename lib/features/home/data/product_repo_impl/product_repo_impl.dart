import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/features/home/data/data_sources/products_remote_data_source.dart';
import 'package:wasil_flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:wasil_flutter_task/features/home/domain/repository/product_repo.dart';

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

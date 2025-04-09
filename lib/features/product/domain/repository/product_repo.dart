import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/core/errors/failures.dart' show Failure;
import 'package:wasil_flutter_task/features/product/domain/entities/product_entity.dart';

abstract interface class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}

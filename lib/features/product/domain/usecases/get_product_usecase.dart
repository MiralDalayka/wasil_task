import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/features/product/domain/entities/product_entity.dart';
import 'package:wasil_flutter_task/features/product/domain/repository/product_repo.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetProductsUsecase implements Usecase<List<ProductEntity>, NoParams> {
  const GetProductsUsecase();

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams noParams) async {
    return await serviceLocator<ProductRepo>().getProducts();
  }
}

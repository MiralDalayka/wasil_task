import 'package:dio/dio.dart';
import 'package:wasil_flutter_task/features/product/data/models/product_model.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../core/network/client/dio_client.dart';
import '../../../../core/network/client/endpoints.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ProductRemoteDataSourceImpl();
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await serviceLocator<DioClient>().get(
        EndPoints.products,
      );

      if (response.statusCode == 200) {
        List<dynamic> productsData = response.data['products'];
        return productsData
            .map((element) => ProductModel.fromJson(element))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}

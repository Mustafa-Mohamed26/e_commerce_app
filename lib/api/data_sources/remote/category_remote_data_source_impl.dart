import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/mapper/category_mapper.dart';
import 'package:e_commerce_app/api/web_services.dart';
import 'package:e_commerce_app/core/exceptions/app_exceptions.dart';
import 'package:e_commerce_app/data/data_sources/remote/category_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  WebServices webServices;

  CategoryRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      var categoryRepository = await webServices.getAllCategories();
      // list<categoryDto> to list<Category>
      return categoryRepository.data
          ?.map((categoryDto) => categoryDto.toCategory())
          .toList();
    } on DioException catch (e) {
      String message = (e.error as AppExceptions).message;
      throw ServerException(message: message);
    }
  }
}

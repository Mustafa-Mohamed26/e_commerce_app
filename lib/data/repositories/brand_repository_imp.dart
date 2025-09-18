import 'package:e_commerce_app/data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';
import 'package:e_commerce_app/domain/repositories/brands/brand_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImp implements BrandRepository{
  BrandRemoteDataSource brandRemoteDataSource;

  BrandRepositoryImp({required this.brandRemoteDataSource});

  @override
  Future<List<Category>?> getAllBrands() {
    return brandRemoteDataSource.getAllBrands();
  }
}
import 'package:e_commerce_app/api/models/response/common/category_dto.dart';
import 'package:e_commerce_app/domain/entities/response/category.dart';

extension CategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(id: id, name: name, image: image, slug: slug);
  }
}

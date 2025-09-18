import 'package:json_annotation/json_annotation.dart';

part 'brand_response_dto.g.dart';

@JsonSerializable()
class BrandResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "data")
  final List<Data>? data;

  BrandResponseDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BrandResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandResponseDtoToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "nextPage")
  final int? nextPage;

  Metadata ({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  Data ({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}



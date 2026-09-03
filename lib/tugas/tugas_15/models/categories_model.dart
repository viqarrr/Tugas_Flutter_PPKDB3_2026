import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

@JsonSerializable()
class Categories {
  @JsonKey(name: "categories")
  final List<Category> categories;

  Categories({required this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "idCategory")
  final String idCategory;
  @JsonKey(name: "strCategory")
  final String strCategory;
  @JsonKey(name: "strCategoryThumb")
  final String strCategoryThumb;
  @JsonKey(name: "strCategoryDescription")
  final String strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

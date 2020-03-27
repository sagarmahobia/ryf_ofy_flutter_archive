import 'dart:convert';

class CategoriesDTO {
  List<Category> categories;

  CategoriesDTO(this.categories);

  factory CategoriesDTO.fromJson(List<dynamic> str) =>
      CategoriesDTO(List<Category>.from(str.map((x) => Category.fromJson(x))));
}

class Category {
  String id;
  String title;
  String image;
  String opportunityType;

  Category({
    this.id,
    this.title,
    this.image,
    this.opportunityType,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        opportunityType: json["opportunityType"],
      );
}

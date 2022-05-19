// To parse this JSON data, do
//
//     final popularDishModel = popularDishModelFromJson(jsonString);

import 'dart:convert';

PopularDishModel popularDishModelFromJson(String str) =>
    PopularDishModel.fromJson(json.decode(str));

String popularDishModelToJson(PopularDishModel data) =>
    json.encode(data.toJson());

class PopularDishModel {
  PopularDishModel({
    this.dishes,
    this.popularDishes,
  });

  List<Dish>? dishes;
  List<PopularDish>? popularDishes;

  factory PopularDishModel.fromJson(Map<String, dynamic> json) =>
      PopularDishModel(
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
        popularDishes: List<PopularDish>.from(
            json["popularDishes"].map((x) => PopularDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dishes": List<dynamic>.from(dishes!.map((x) => x.toJson())),
        "popularDishes":
            List<dynamic>.from(popularDishes!.map((x) => x.toJson())),
      };
}

class Dish {
  Dish({
    this.name,
    this.rating,
    this.description,
    this.equipments,
    this.image,
    this.id,
  });

  String? name;
  double? rating;
  String? description;
  List<String>? equipments;
  String? image;
  int? id;

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        name: json["name"],
        rating: json["rating"].toDouble(),
        description: json["description"],
        equipments: List<String>.from(json["equipments"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "description": description,
        "equipments": List<dynamic>.from(equipments!.map((x) => x)),
        "image": image,
        "id": id,
      };
}

class PopularDish {
  PopularDish({
    this.name,
    this.image,
    this.id,
  });

  String? name;
  String? image;
  int? id;

  factory PopularDish.fromJson(Map<String, dynamic> json) => PopularDish(
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
      };
}

import '../../../../core/database/api/end_points.dart';

class MealModel {
  final String id;
  final String name;
  final String description;
  final int price;
  final String howToSell;
  final List<String> images;
  final String category;
  final String chefId;
  final String status;
  final String createdAt;
  final String updatedAt;
  const MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.howToSell,
    required this.images,
    required this.category,
    required this.chefId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      howToSell: json['howToSell'],
      images: List<String>.from(json['images']),
      category: json['category'],
      chefId: json['chefId'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class GetAllMealsModel {
  final String message;
  final List<MealModel> meals;
  factory GetAllMealsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllMealsModel(
        message: jsonData[ApiKeys.message],
        meals: jsonData['meals']
            .map<MealModel>((i) => MealModel.fromJson(i))
            .toList());
  }

  GetAllMealsModel({required this.message, required this.meals});
}

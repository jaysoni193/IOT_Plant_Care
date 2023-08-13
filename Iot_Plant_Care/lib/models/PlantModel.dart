// To parse this JSON data, do
//
//     final plantModel = plantModelFromJson(jsonString);

import 'dart:convert';

List<PlantModel> plantModelFromJson(String str) => List<PlantModel>.from(json.decode(str).map((x) => PlantModel.fromJson(x)));

String plantModelToJson(List<PlantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlantModel {


  PlantModel({
    required this.id,
    required this.plantId,
    required this.plantname,
    required this.image,
    required this.shortDescription,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String plantId;
  String plantname;
  String image;
  String shortDescription;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory PlantModel.fromJson(Map<String, dynamic> json) => PlantModel(
    id: json["id"],
    plantId: json["plant_id"],
    plantname: json["plantname"],
    image: json["image"],
    shortDescription: json["short_description"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plant_id": plantId,
    "plantname": plantname,
    "image": image,
    "short_description": shortDescription,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

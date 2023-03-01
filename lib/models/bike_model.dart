import 'dart:convert';

List<BikeModel> bikeModelFromJson(String str) => List<BikeModel>.from(json.decode(str).map((x) => BikeModel.fromJson(x)));

String bikeModelToJson(List<BikeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BikeModel {
    BikeModel({
        required this.company,
        required this.logo,
        required this.bikeImage,
        required this.description,
        required this.models,
        required this.modelImage,
    });

    String company;
    String logo;
    String bikeImage;
    String description;
    String models;
    String modelImage;

    factory BikeModel.fromJson(Map<String, dynamic> json) => BikeModel(
        company: json["company"],
        logo: json["logo"],
        bikeImage: json["bike_image"],
        description: json["description"],
        models: json["models"],
        modelImage: json["model_image"],
    );

    Map<String, dynamic> toJson() => {
        "company": company,
        "logo": logo,
        "bike_image": bikeImage,
        "description": description,
        "models": models,
        "model_image": modelImage,
    };
}


import 'dart:convert';

List<BikeCategoriesModel> bikeCategoriesModelFromJson(String str) => List<BikeCategoriesModel>.from(json.decode(str).map((x) => BikeCategoriesModel.fromJson(x)));

String bikeCategoriesModelToJson(List<BikeCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BikeCategoriesModel {
  BikeCategoriesModel({
    required this.brand,
    required this.image,
    required this.logo,
    required this.description,
    required this.imageId,
    required this.logoId,
  });

  final String brand;
  final String image;
  final String logo;
  final String description;
  final String imageId;
  final String logoId;

    factory BikeCategoriesModel.fromJson(Map<String, dynamic> json) => BikeCategoriesModel(
      logo: json['logo'] ,
      brand: json['brand'] ,
      image: json['image'],
      description: json['description'],
      imageId: json['imageId'],
      logoId: json['logoId']
    );

    Map<String, dynamic> toJson() => {
      'logo': 'logo' ,
      'brand': 'brand' ,
      'image': 'image',
      'description': 'description',
      'imageId':'imageId',
      'logoId':'logoId'
    };

  BikeCategoriesModel copyWith({
    String? brand,
    String? image,
    String? logo,
    String? description,
    String? imageId,
    String? logoId,
    
  }) {
    return BikeCategoriesModel(
      brand: brand ?? this.brand,
      image: image ?? this.image,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      imageId: imageId ?? this.imageId,
      logoId: logoId ?? this.logoId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'brand': brand});
    result.addAll({'image': image});
    result.addAll({'logo': logo});
    result.addAll({'description': description});
    result.addAll({'imageId': imageId});
    result.addAll({'logoId': logoId});
  
    return result;
  }

  factory BikeCategoriesModel.fromMap(Map<String, dynamic> map) {
    return BikeCategoriesModel(
      brand: map['brand'] ?? '',
      image: map['image'] ?? '',
      logo: map['logo'] ?? '',
      description: map['description'] ?? '',
      imageId: map['imageId'] ?? '',
      logoId: map['logoId'] ?? '',
    );
  }

  

  @override
  String toString() {
    return 'BikeCategoriesModel(brand: $brand, image: $image, logo: $logo, description: $description, imageId: $imageId, logoId: $logoId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BikeCategoriesModel &&
      other.brand == brand &&
      other.image == image &&
      other.logo == logo &&
      other.description == description &&
      other.imageId == imageId &&
      other.logoId == logoId;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
      image.hashCode ^
      logo.hashCode ^
      description.hashCode ^
      imageId.hashCode ^
      logoId.hashCode;
  }
}

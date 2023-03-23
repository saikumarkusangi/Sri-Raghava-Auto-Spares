import 'dart:convert';

List<SpareCategoriesModel> SpareCategoriesModelFromJson(String str) =>
    List<SpareCategoriesModel>.from(
        json.decode(str).map((x) => SpareCategoriesModel.fromJson(x)));

String SpareCategoriesModelToJson(List<SpareCategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpareCategoriesModel {
  SpareCategoriesModel({
    required this.name,
    required this.image,
    required this.imageId,
  });

  final String name;
  final String image;
  final String imageId;

  factory SpareCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SpareCategoriesModel(
        name: json['name'],
        image: json['image'],
        imageId: json['imageId'],
      );

  Map<String, dynamic> toJson() => {
        'name': 'name',
        'image': 'image',
        'imageId': 'imageId',
      };

  SpareCategoriesModel copyWith({
    String? name,
    String? image,
    String? imageId,
  }) {
    return SpareCategoriesModel(
      name: name ?? this.name,
      image: image ?? this.image,
      imageId: imageId ?? this.imageId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'image': image});

    result.addAll({'imageId': imageId});

    return result;
  }

  factory SpareCategoriesModel.fromMap(Map<String, dynamic> map) {
    return SpareCategoriesModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      imageId: map['imageId'] ?? '',
    );
  }

  @override
  String toString() {
    return 'SpareCategoriesModel(brand: $name, image: $image, imageId: $imageId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpareCategoriesModel &&
        other.name == name &&
        other.image == image &&
        other.imageId == imageId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ image.hashCode ^ imageId.hashCode;
  }
}

import 'package:dio/dio.dart';
import 'package:website/constants/theme_data.dart';
import 'package:website/models/bike_model.dart';

class RemoteServices{
  static var dio = Dio();

  static Future<List<BikeModel>> fetchBikes() async{
    var response = await dio.get(appscriptUrl);
    if(response.statusCode == 200){
      final List<dynamic> data = response.data;
      return data.map((item) => BikeModel.fromJson(item)).toList();
    }else{
      throw Exception('Failed to load data!!');
    }
  }
}
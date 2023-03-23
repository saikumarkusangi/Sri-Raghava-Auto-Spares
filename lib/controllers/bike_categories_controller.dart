import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../models/models.dart';

class BikeCategoriesController extends ChangeNotifier{

  bool isLoading = false;
  List<BikeCategoriesModel> _bikes = [];
  List<BikeCategoriesModel> get  bikes => _bikes;

  BikeCategoriesController(){
    fetchBrands();
  }

  // Future<void> fetchBikes() async{
  //  isLoading = true;
  //  notifyListeners();
  //  _bikes = await RemoteServices.fetchBikes();
  //  isLoading = false;
  //  notifyListeners();
  // }

   Future<void> fetchBrands() async{
    print('fetchbike controller');
   isLoading = true;
   notifyListeners();
   _bikes = await DataBaseHelper.instance.fetchBikes();
   isLoading = false;
   notifyListeners();
  }
}
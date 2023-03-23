import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../models/models.dart';

class SpareCategoriesController extends ChangeNotifier{

  bool isLoading = false;
  List<SpareCategoriesModel> _spares = [];
  List<SpareCategoriesModel> get  spares => _spares;

  SpareCategoriesController(){
    fetchSpares();
  }

  // Future<void> fetchBikes() async{
  //  isLoading = true;
  //  notifyListeners();
  //  _bikes = await RemoteServices.fetchBikes();
  //  isLoading = false;
  //  notifyListeners();
  // }

   Future<void> fetchSpares() async{
    print('fetchspare controller');
   isLoading = true;
   notifyListeners();
   _spares = await DataBaseHelper.instance.fetchSpares();
   isLoading = false;
   notifyListeners();
  }
}
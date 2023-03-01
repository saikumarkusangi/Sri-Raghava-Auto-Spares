import 'package:flutter/material.dart';
import 'package:website/models/bike_model.dart';
import 'package:website/services/remote_services.dart';

class BikeController extends ChangeNotifier{

  bool isLoading = false;
  List<BikeModel> bikes = [];

  BikeController(){
    fetchBikes();
  }

  Future<void> fetchBikes() async{
   isLoading = true;
   notifyListeners();
   bikes = await RemoteServices.fetchBikes();
   isLoading = false;
   notifyListeners();
  }
}
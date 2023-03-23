import 'package:appwrite/models.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:website/common/error_page.dart';
import 'package:website/common/image_picker.dart';
import 'package:website/constants/appwrite_constants.dart';
import 'package:website/models/models.dart';

import '../main.dart';

class DataBaseHelper{
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper _instance = DataBaseHelper._privateConstructor();
  static DataBaseHelper get instance => _instance;
  static Databases? databases;
  static Storage? storage;

  static init(){
    databases = Databases(client);
     storage = Storage(client);
  }

  addBikes(brand,description,imagePath,logoPath,imageByte,logoByte) async{
      databases ?? init();
    print('adding');
     try {
    File logo = await uploadImage(imagePath,imageByte,brand);
    File image = await uploadImage(logoPath,logoByte,"${brand+'_'+'logo'}");
      DocumentList;
       final response = await databases!.createDocument(
        documentId:brand,
        databaseId:AppWriteConstants.categoriesDataBaseId ,
        collectionId:AppWriteConstants.BikeCategoriesId ,
        data: {
          'brand':brand,
          'description':description,
          'imageId':image.$id,
          'logoId':logo.$id,
          'image':'http://139.59.85.104/v1/storage/buckets/6405f4b91e58ee065721/files/${image.$id}/view?project=63ff7e4d450981c24c8c&mode=admin',
          'logo':'http://139.59.85.104/v1/storage/buckets/6405f4b91e58ee065721/files/${logo.$id}/view?project=63ff7e4d450981c24c8c&mode=admin'
        }
       
      );
 
      Get.toNamed('/');
      Get.snackbar(
        
        'Uploaded Successfully', ' product was updated succesfully to database',backgroundColor: Colors.white);

     } catch (e) {
      print(e);
     Get.to( ErrorPage(error:e.toString()));
  
     }
      
      
    }

  deleteBikeCatergories(id,ImageId,logoId) async{
      databases ?? init();
    print('deleting');
     try {
      DocumentList;
        await storage!.deleteFile(bucketId: AppWriteConstants.bucketId, fileId: ImageId);
          await storage!.deleteFile(bucketId: AppWriteConstants.bucketId, fileId: logoId);
        await databases!.deleteDocument(
        documentId:id,
        databaseId:AppWriteConstants.categoriesDataBaseId ,
        collectionId:AppWriteConstants.BikeCategoriesId ,

      );
    
      Get.toNamed('/');
      Get.snackbar(
        
        'Deleted Successfully', ' product was deleted succesfully to database',backgroundColor: Colors.white);

     } catch (e) {
      print(e);
     Get.to( ErrorPage(error: e.toString(),));
  
     }

  }
     
      updateBikes(brand,description) async{
      databases ?? init();
    print('updating');
     try {
      DocumentList;
       final response = await databases!.updateDocument(
        documentId:brand,
        databaseId:AppWriteConstants.categoriesDataBaseId ,
        collectionId:AppWriteConstants.BikeCategoriesId ,
        data: {
         
          'brand':brand,
          'description':description,
          
        }
      );
     
      Get.toNamed('/');
      Get.snackbar(
        
        'Uploaded Successfully', 'New product was added succesfully to database',backgroundColor: Colors.white);

     } catch (e) {
      print(e);
     Get.to( ErrorPage(error: e.toString(),));
  
     }
      
    }
  fetchBikes() async{
      databases ?? init();
    print('bikes loading');
     try {
      DocumentList;
       final response = await databases!.listDocuments(
        databaseId:AppWriteConstants.categoriesDataBaseId ,
        collectionId:AppWriteConstants.BikeCategoriesId ,
      );
       
      return response.documents
      .map((e) => BikeCategoriesModel.fromJson(e.data))
      .toList();
     } catch (e) {
      print(e);
     Get.to( ErrorPage(error: e.toString(),));
  
     }
      
      
    }
    

 fetchSpares() async{
      databases ?? init();
    print('spares loading');
     try {
      DocumentList;
       final response = await databases!.listDocuments(
        databaseId:AppWriteConstants.categoriesDataBaseId ,
        collectionId:AppWriteConstants.SparesCategoriesId ,
      );
       
      return response.documents
      .map((e) => SpareCategoriesModel.fromJson(e.data))
      .toList();
     } catch (e) {
      print(e);
     Get.to( ErrorPage(error: e.toString(),));
  
     }
      
      
    }


  uploadImage(String imagePath,XFile file,id) async {
    storage ?? init();
    List<int> fileBytes = await file.readAsBytes();
    try {
     File image = await storage!.createFile(
        bucketId: AppWriteConstants.bucketId,
         fileId: ID.unique(),
         
          file: InputFile(
            bytes: fileBytes,
            path: imagePath,
          filename:id)
          ) ;
        
         
          return image;
    } catch (e) {
       print(e);
     Get.to( ErrorPage(error: e.toString(),));
    }
  }

  uploadLogo(String logoPath,XFile file) async {
    storage ?? init();
    List<int> fileBytes = await file.readAsBytes();
    try {
     File logo = await storage!.createFile(
        bucketId:AppWriteConstants.bucketId ,
         fileId: ID.unique(),
         
          file: InputFile(
            bytes: fileBytes,
            path: logoPath,
          filename: logoPath.split("/").last)
          ) ;
        
          
          return logo;
    } catch (e) {
       print(e);
     Get.to( ErrorPage(error: e.toString(),));
    }
  }
   
    
  }

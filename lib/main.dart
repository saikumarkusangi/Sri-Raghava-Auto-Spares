import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/common/error_page.dart';
import 'package:website/controllers/bike_categories_controller.dart';
import 'package:website/controllers/spare_categories_controller.dart';
import 'package:website/views/mobile/mobile_home.dart';
import 'package:website/views/mobile/model_page.dart';
import 'package:website/views/web/web_home.dart';
import 'constants/appwrite_constants.dart';
import 'controllers/carousel_controller.dart';
import 'responsive/responsive.dart';
import 'package:provider/provider.dart';
import 'package:appwrite/appwrite.dart';


Client client = Client();
void main() {
 
client
    .setEndpoint(AppWriteConstants.endPoint)
    .setProject(AppWriteConstants.projectId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> BikeCategoriesController()),
        ChangeNotifierProvider(create: (_)=> CarouselIndexController()),
         ChangeNotifierProvider(create: (_)=> SpareCategoriesController())
      ],
      child:  GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(
            name: '/', 
            page: ()=> const Responsive(mobile: MobileHome(), web: WebHome())),
            GetPage(name: '/mobileHome', page:()=>const MobileHome()),
            GetPage(name: '/webHome', page:()=>const WebHome()),
            // GetPage(name: '/error', page:()=>const ErrorPage())
          ],
          debugShowCheckedModeBanner: false,
          title: 'Sri Raghava Auto Spares',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
         
        ),
    
  );
  }
}


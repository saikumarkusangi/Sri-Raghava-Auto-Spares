import 'package:flutter/material.dart';
import 'package:website/controllers/bike_controller.dart';
import 'package:website/views/mobile/mobile_home.dart';
import 'package:website/views/web/web_home.dart';
import 'constants/appwrite_constants.dart';
import 'controllers/carousel_controller.dart';
import 'responsive/responsive.dart';
import 'package:provider/provider.dart';
import 'package:appwrite/appwrite.dart';

void main() {
 
Client client = Client();
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
        ChangeNotifierProvider(create: (_)=> BikeController()),
        ChangeNotifierProvider(create: (_)=> CarouselIndexController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sri Raghava Auto Spares',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const Responsive(
          mobile: MobileHome(),
          web: WebHome(),
        ) ,
      ),
    );
  }
}


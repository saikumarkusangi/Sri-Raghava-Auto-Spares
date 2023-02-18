// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'widgets/bikes_list.dart';
import 'widgets/carousel.dart';

class MobileHome extends StatefulWidget {
const MobileHome({Key? key}) : super(key: key);

@override
State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
@override
Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.white,
appBar: AppBar(
  centerTitle: true,
toolbarHeight:100,
backgroundColor: Color(0xff011673),
title:  Image.asset('assets/images/logo.png',width:200),
actions: const [],
),
body: SingleChildScrollView(
child: Column(
children: [
  Carousel(),
 const SizedBox(height: 50,),
const Text('Browse By Brand',style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: Colors.black
  ),),
  const SizedBox(height: 20,),
  Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Divider(
    color: Colors.black38,
    thickness: 2,
    ),
  ),
  BikesList()
],
),
),
);
}
}

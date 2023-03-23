// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:website/constants/constants.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
   
   ErrorPage({super.key, this.error  = ''});
  String error;
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(ImageAssets.error,fit: BoxFit.cover,),
            ),
            Text(widget.error,style: const TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }
}

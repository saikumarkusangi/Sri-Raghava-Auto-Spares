import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget web;
  const Responsive({super.key,
  required this.mobile,
  required this.web
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,Constraints) {
        if (Constraints.maxWidth < 600) {
          return mobile;
          
        }else{
          return web;
        }
      },
    );
  }
}
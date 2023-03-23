import 'dart:convert';

import 'package:flutter/material.dart';

class CustomTextFormField {

 static customTextFormField(controller,hintText){
    return TextFormField(
      maxLines: 3,
      style: const TextStyle(fontSize: 24),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(fontSize: 24)
      ),
      validator: (value) {
        if (value!.isEmpty || value.length < 3) {
          return 'Enter $hintText';
        }
        return null;
      },
    );
  }

}

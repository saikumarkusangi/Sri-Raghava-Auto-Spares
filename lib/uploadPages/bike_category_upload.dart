// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:website/common/image_picker.dart';
import 'package:website/helpers/helpers.dart';

import '../common/common.dart';
import '../constants/theme_data.dart';
import '../common/common.dart';

class BikeCategoryUplaod extends StatefulWidget {
  const BikeCategoryUplaod({Key? key}) : super(key: key);

  @override
  State<BikeCategoryUplaod> createState() => _BikeCategoryUplaodState();
}

class _BikeCategoryUplaodState extends State<BikeCategoryUplaod> {
  TextEditingController brand = TextEditingController();
  TextEditingController description = TextEditingController();
  final formkey = GlobalKey<FormState>();
   final ImagePicker picker = ImagePicker();
  String imagePath = '';
  String logoPath = '';
  late XFile imageByte;
   late XFile logoByte;
  upload() async {
    if (formkey.currentState!.validate()) {
      await DataBaseHelper.instance.addBikes(
         brand.text,
         description.text,
         imagePath,
         logoPath,
         imageByte,
         logoByte
         );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextFormField.customTextFormField(
                    
                    brand, 'Enter Brand Name'),
               const SizedBox(
                  height: 20,
                ),
                CustomTextFormField.customTextFormField(
                 description, 'Enter Description'),
               const SizedBox(
                  height: 20,
                ),
              const  SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                 final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if(image != null){
                setState(() {
                  imagePath = image.path;
                  imageByte = image;
              
                });
               }
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.of(context).size.width/3,
                        child: 
                         Image.network('https://static.vecteezy.com/system/resources/thumbnails/013/121/632/small_2x/instagram-plus-sets-upload-blue-dotted-line-line-icon-free-vector.jpg',
                        fit: BoxFit.contain,),
                      ),
                     const Text('Upload Logo',style: TextStyle(
                          fontSize: 24,
                          color: Colors.black54
                         ),)
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
               
                   InkWell(
                  onTap: () async {
             final XFile? logo = await picker.pickImage(source: ImageSource.gallery);
                  if(logo != null){
                setState(() {
                  logoPath = logo.path;
                  logoByte = logo;
              
                });
                  }},
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.of(context).size.width/3,
                        child:  Image.network('https://static.vecteezy.com/system/resources/thumbnails/013/121/632/small_2x/instagram-plus-sets-upload-blue-dotted-line-line-icon-free-vector.jpg',
                        fit: BoxFit.contain,),
                      ),
                    const  Text('Upload Image',style: TextStyle(
                          fontSize: 24,
                          color: Colors.black54
                         ),)
                    ],
                  ),
                ),
                  
            
        
    
                 const SizedBox(height: 20,),
                ActionChip(
                  backgroundColor: Themedata.appBarColor,
                  labelPadding: const EdgeInsets.all(10),
                  onPressed: () => upload(),
                  label: const Text(
                    'Upload',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

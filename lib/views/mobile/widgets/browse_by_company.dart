import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/bike_controller.dart';
import '../../../constants/theme_data.dart';
import '../model_page.dart';
import '../model_page.dart';
import 'loader.dart';

class BikesList extends StatelessWidget {
  const BikesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BikeController>(context);
    return (controller.isLoading)
        ? const Loader()
        : Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.bikes.length,
                itemBuilder: (context, index) {
                  
                  final bike = controller.bikes[index];
                  final models = bike.models.split(',');
                  final modelImages = bike.modelImage.split(',');
                  final brand = bike.company;
                  int random = Random().nextInt(5);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>
                        ModelsPage(
                          brand: brand,
                          models:models,
                          modelImages:modelImages
                        )));
                      },
                      child: Container(
                        height: 245,
                        color:  colors[random],
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                    
                        // bike name
                              
                              Text(
                                '${bike.company} STORE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: (random == 3 )
                                        ? Colors.black
                                        : Colors.white),
                              ),
                        // bike description     
                        
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Text(
                                  bike.description,
                                  style: TextStyle(
                                      color: (random == 3)
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          minimumSize: const Size(80, 50)),
                                      child: const Text(
                                        'Visit Now',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      )),
                    
                        // bike image
                    
                                  Container(
                                    
                                    width: MediaQuery.of(context).size.width / 2.2,
                                    height: 150,
                                    child: Image.network(bike.bikeImage,fit: BoxFit.scaleDown,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}

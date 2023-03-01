import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants/contants.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  int random = Random().nextInt(5);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
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
                              'BIKE STORE',
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
                                'All spare parts for this bikea are available',
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
                              mainAxisAlignment: MainAxisAlignment.start,
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
                    
                                // Container(
                                  
                                //   width: MediaQuery.of(context).size.width / 2.2,
                                //   height: 150,
                                //   child: Image.network(bike.bikeImage,fit: BoxFit.scaleDown,),
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
  }
}
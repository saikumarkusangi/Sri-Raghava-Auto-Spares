import 'dart:math';

import 'package:flutter/material.dart';

class BikesList extends StatelessWidget {
  List colors = [
    Color(0xFF26c1ce),
   Color(0xFF1e2d7d),
    Color.fromARGB(255, 1, 103, 121),
    Color.fromARGB(255, 195, 195, 195),
     Color.fromARGB(255, 221, 115, 238)
    
    ];
    List bikes = [
     {
      'name':'Bajaj',
      'image':'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/3_1830b52b-7101-47a6-9bc4-a29fce0cbe2f_x480.png?v=1617186461'
     },
     {
      'name':'Hero',
      'image':'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/5_a7bef594-a02e-49ef-ac12-a6431d55cf8e_x480.png?v=1617186461'
     },
     {
      'name':'Honda',
      'image':'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/8_x480.png?v=1617186461'
     },
     {
      'name':'Yamaha',
      'image':'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/4_43d64703-1a35-4fef-b3b7-3931c623b420_x480.png?v=1617186461'
     }
    ];
   BikesList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
       itemCount: bikes.length,
        itemBuilder: (context,index){
          int random = Random().nextInt(5);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              color: colors[random],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${bikes[index]['name']} Store',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color:(random == 3)?
                       Colors.black : Colors.white
                      ),),
                      SizedBox(height: 5,),
                     Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Text('Spare parts for bajaj bikes like spendor,honda ,scooty,bike,bonfa',
                      style: TextStyle(
                      
                        color:(random == 3)?
                       Colors.black : Colors.white,
                        fontSize: 20
                        ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){

                          },
                          style: ElevatedButton.styleFrom(
                           primary: Colors.orange,
                           minimumSize: Size(80, 50)
                          ),
                          child:const Text('Visit Now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                          ),)),

                          Container(
                            width: 160,
                            child: Image.network(bikes[index]['image']),
                          )

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        ),
    );
  }
}
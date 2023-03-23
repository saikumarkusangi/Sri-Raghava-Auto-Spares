import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:website/helpers/helpers.dart';
import '../../../updatePages/update.dart';
import '../../../uploadPages/bike_category_upload.dart';
import '../../../constants/theme_data.dart';
import '../../../controllers/controllers.dart';
import 'loader.dart';

class BikesList extends StatelessWidget {
  const BikesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BikeCategoriesController>(context);
    return (controller.isLoading)
        ? const Loader()
        : Column(
          children: [
            Container(
              child: ListView.builder(
                
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.bikes.length,
                  itemBuilder: (context, index) {
                    
                    final bike = controller.bikes[index];
                    final brand = bike.brand;
                    int random = Random().nextInt(5);
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (_)=>
                          // ModelsPage(
                          //   brand: brand,
                            
                          // )));
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
                                  '${bike.brand} STORE',
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
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                             DataBaseHelper.instance.deleteBikeCatergories(brand,bike.imageId,bike.logoId);
                                            
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                                minimumSize: const Size(80, 50)),
                                            child: const Text(
                                              '   Delete  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            )),
                                           const SizedBox(height: 10,),
                                            ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (_)=> BikeCategoryUpdate(
                                              brand: bike.brand,
                                                description: bike.description,
                                            )));
                                        //  DataBaseHelper.instance.updateBikes(
                                        //   bike.brand,
                                        //   'brand', 
                                        //   'description'
                                        //   );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            minimumSize: const Size(80, 50)),
                                        child: const Text(
                                          '     Edit    ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        )),
                                      ],
                                    ),
                      
                          // bike image
                      
                                    Container(
                                      
                                      width: MediaQuery.of(context).size.width / 2.2,
                                      height: 150,
                                      child: Image.network(bike.image,fit: BoxFit.scaleDown,),
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
            ),
            ActionChip(
              backgroundColor: Themedata.appBarColor,
              labelPadding:const EdgeInsets.all(10),
              onPressed: (){
              print('pres');
               Navigator.push(context, MaterialPageRoute(builder: (_)=>BikeCategoryUplaod()));
              
              },
              label: const Text('Add new product',style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),),
            )
          ],
        );
  }
}

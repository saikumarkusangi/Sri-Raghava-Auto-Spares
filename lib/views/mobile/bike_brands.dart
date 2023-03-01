import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/common/app_bar.dart';
import 'package:website/controllers/bike_controller.dart';
import 'package:website/views/mobile/model_page.dart';

class BikeBrands extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => const BikeBrands());
  const BikeBrands({
    Key? key,
  }) : super(key: key);

  @override
  State<BikeBrands> createState() => _BikeBrandsState();
}

class _BikeBrandsState extends State<BikeBrands> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BikeController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: 
          [
            const CustomAppBar(),
            SliverList(delegate: SliverChildListDelegate([
              Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.all(20.0),
                  child: Text(
                    'Explore our Bike Brands',
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 69, 124),
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    color: Colors.black26,
                    thickness: 2,
                  ),
                ),
                (controller.isLoading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.bikes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) {
                          final bike = controller.bikes[index];
                  final models = bike.models.split(',');
                  final modelImages = bike.modelImage.split(',');
                  final brand = bike.company;
                          return InkWell(
                            onTap: (){
                               Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>
                        ModelsPage(
                          brand:brand ,
                          models:models,
                          modelImages:modelImages
                        )));
                            },
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(controller.bikes[index].logo),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
            ]))
        ],
      ),
    );
  }
}

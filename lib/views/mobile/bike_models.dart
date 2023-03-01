// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/bike_controller.dart';

import '../../common/app_bar.dart';

class BikeModelPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => const BikeModelPage());
  const BikeModelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BikeModelPage> createState() => _BikeModelPageState();
}

class _BikeModelPageState extends State<BikeModelPage> {
  @override
  Widget build(BuildContext context) {
    final bikeModels = Provider.of<BikeController>(context);
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
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Explore our Bike Models',
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
                (bikeModels.isLoading)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                       physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bikeModels.bikes.length,
                        itemBuilder: ((context, index) {
                          final bikeModel =
                              bikeModels.bikes[index].modelImage.split(',');
                          return GridView.builder(
                             physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: bikeModel.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(bikeModel[index]),
                                ),
                              );
                            },
                          );
                        }))
              ],
            ),
          ),
            ])),
           
        ],
      ),
    );
  }
}

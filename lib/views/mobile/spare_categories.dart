import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/common/app_bar.dart';
import 'package:website/controllers/controllers.dart';
import 'package:website/controllers/spare_categories_controller.dart';
import 'package:website/views/mobile/model_page.dart';

import '../../constants/constants.dart';

class SpareCollections extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => const SpareCollections());
  const SpareCollections({
    Key? key,
  }) : super(key: key);

  @override
  State<SpareCollections> createState() => _SpareCollectionsState();
}

class _SpareCollectionsState extends State<SpareCollections> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SpareCategoriesController>(context);
    Grid() {
      return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.spares.length,
          itemBuilder: ((context, index) {
            final spare = controller.spares[index];
            final name = spare.name;
            return InkWell(
              onTap: () {
                //        Navigator.push(context, MaterialPageRoute(
                //   builder: (_)=>
                // ModelsPage(
                //   brand:brand ,
                //   models:models,
                //   modelImages:modelImages
                // )));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Stack(
                  children: [
                    Container(
                        height: 140,
                        width: double.maxFinite,
                        child: Image.network(
                          spare.image,
                          fit: BoxFit.cover,
                        )),

                        Center(
                          child: Positioned(
                            top: 50,
                            child: Text(
                              spare.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: Container(
                            height: 50,
                            decoration:const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.black54,
                                Colors.white
                              ],
                              begin: FractionalOffset.center,end: FractionalOffset.bottomCenter)
                            ),
                          )
                          ,
                        )
                  ],
                ),
              ),
            );
          }));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Spare Collection',
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
                      : Grid(),
                  const SizedBox(
                    height: 20,
                  ),
                  ActionChip(
                    backgroundColor: Themedata.appBarColor,
                    labelPadding: const EdgeInsets.all(10),
                    onPressed: () {
                      print('press');
                      //  Navigator.push(context, MaterialPageRoute(builder: (_)=>BikeCategoryUplaod()));
                    },
                    label: const Text(
                      'Add new product',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

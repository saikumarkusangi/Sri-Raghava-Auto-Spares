import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:website/constants/constants.dart';
import 'package:website/views/mobile/bike_models.dart';
import '../../../controllers/carousel_controller.dart';
import '../bike_brands.dart';
import '../spare_categories.dart';



class Carousel extends StatefulWidget {
 const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselIndexController>(
        builder: ((context, value, child) => Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      aspectRatio: 1,
                      onPageChanged: ((index, reason) {
                        value.changeIndex(index);
                      })),
                  items: ImageAssets.imgList
                      .map((e) => Stack(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    e,
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                left: MediaQuery.of(context).size.width / 3.2,
                                bottom: MediaQuery.of(context).size.height / 8,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (value.currentIndex == 0) {
                                      //  Navigator.push(context, BikeModelPage.route());
                                      } else if (value.currentIndex == 1) {
                                       Navigator.push(context, BikeBrands.route());
                                      } else {
                                      Navigator.push(context,
                                       MaterialPageRoute(builder: (_)=>const SpareCollections()));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        minimumSize: const Size(80, 50)),
                                    child: const Text(
                                      'SHOP NOW',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    )),
                              ),
                            ],
                          ))
                      .toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ImageAssets.imgList.asMap().entries.map((e) {
                        bool yes = value.currentIndex == e.key;
                        return Container(
                          width: yes ? 25 : 10,
                          height: 10,
                          margin:const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: yes ? Colors.blueAccent : Colors.black26),
                        );
                      }).toList()),
                )
              ],
            )));
  }
}

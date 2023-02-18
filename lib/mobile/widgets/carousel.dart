import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
final List<String> imgList = [
  'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/eautobanners_Desktop_Bike_Model_f651b811-b1c3-490f-bcfb-cdcf3f8f88c4_1400x.jpg?v=1630859021',
  'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/eautobanners_Shop_by_Bike_Brand_c59a0020-501f-4c93-8510-a42c33b246f0_1300x.jpg?v=1630859113',
  'https://cdn.shopify.com/s/files/1/0415/7846/3390/files/eautobanners_Shop_by_spares_CAtegory_b319e8ee-5fca-46e5-992a-0a716f914c72_800x.jpg?v=1630859441',
  
];


class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
   return   Container(
     height: MediaQuery.of(context).size.height/1.5,
     width: MediaQuery.of(context).size.width,
     child: CustomCarouselSlider(
                    items: imgList.map((e) => CarouselItem(
                      image: NetworkImage(e,scale: 1),
                    )).toList(),
                 
                    subHeight: 50,
                   
                    autoplay: true,
                    showText: false,
                    showSubBackground: false,
                    indicatorShape: BoxShape.circle,
                    indicatorPosition: IndicatorPosition.bottom,
                    selectedDotColor: Color(0xff011673),
                    unselectedDotColor: Colors.grey,
                  ),
   );
  }
}

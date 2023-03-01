import 'package:flutter/material.dart';
import 'package:website/constants/contants.dart';
import 'package:website/views/mobile/widgets/search_page.dart';
import '../../common/app_bar.dart';
import 'widgets/browse_by_company.dart';
import 'widgets/carousel.dart';

class MobileHome extends StatefulWidget {
  static route()=> MaterialPageRoute(builder: (_)=>const MobileHome());
  const MobileHome({Key? key}) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themedata.backgroundColor,
     
      body: CustomScrollView(
        slivers: 
          [
          
        
       const CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
            children:const [
               Carousel(),
               SizedBox(
                height: 50,
              ),
               Text(
                'Browse By Company',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black),
              ),
               SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black38,
                  thickness: 2,
                ),
              ),
              BikesList()
            ],
          ),
            ]
          )
          )
        ],
      ),
    );
  }
}

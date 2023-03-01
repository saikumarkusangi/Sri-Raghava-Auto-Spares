import 'package:flutter/material.dart';
import 'package:website/views/mobile/mobile_home.dart';
import '../constants/contants.dart';
import '../views/mobile/widgets/search_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SliverAppBar(
      backgroundColor: Themedata.appBarColor,
      toolbarHeight: 150,
      snap: true,
      automaticallyImplyLeading: false,
      floating: true,
      pinned: false,
      flexibleSpace: Column(
        children: [
          InkWell(
            onTap: ()=>Navigator.push(context, MobileHome.route()),
            child: Image.asset(ImageAssets.logo, width: 180)),
          Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        style: const TextStyle(fontSize: 22),
                        controller: searchController,
                        
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.transparent,
                            hintText: 'Search..'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchPage()));
                    },
                    child: Container(
                      color: Color.fromARGB(255, 75, 107, 251),
                      height: 50,
                      width: 60,
                      child: const Center(
                          child: Icon(
                        Icons.search,
                        size: 26,
                        color: Colors.white,
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

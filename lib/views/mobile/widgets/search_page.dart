import 'package:flutter/material.dart';
import 'package:website/common/app_bar.dart';

import '../../../constants/contants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
        SliverList(delegate: SliverChildListDelegate([
            Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(height: MediaQuery.of(context).size.height/3,),
               const Center(
                  child: Text(
                    'No results found :(',
                    style:
                        TextStyle(color: Themedata.appBarColor, fontSize: 32),
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

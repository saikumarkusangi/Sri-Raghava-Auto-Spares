// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:website/common/app_bar.dart';

// ignore: must_be_immutable
class ModelsPage extends StatefulWidget {
  ModelsPage(
      {Key? key,
      required this.models,
      required this.modelImages,
      required this.brand})
      : super(key: key);

  List models;
  List modelImages;
  String brand;
  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${widget.brand} Models',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 2, 69, 124),
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    color: Colors.black26,
                    thickness: 2,
                  ),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.modelImages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Container(
                                  child: Image.network(
                                widget.modelImages[index],
                                fit: BoxFit.contain,
                              )),
                              //  Text(widget.models[index])
                            ],
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

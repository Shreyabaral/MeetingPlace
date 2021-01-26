import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home_widgets/heading.dart';
import 'home_widgets/item_home.dart';
import 'home_widgets/item_list.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Heading(),
              Home(),
            ],
          )),
    );
  }
}

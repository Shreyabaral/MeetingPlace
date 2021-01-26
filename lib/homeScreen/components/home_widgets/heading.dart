import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
        child: Text(
          "Meeting \nPlace",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            fontFamily: 'Raleway',
            package: 'awesome_package',
          ),
        ),
      ),
    );
  }
}

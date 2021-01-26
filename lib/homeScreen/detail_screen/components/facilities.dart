import 'package:flutter/material.dart';

class Facilities extends StatelessWidget {
  final IconData icon;
  final String facility;

  const Facilities({Key key, this.icon, this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
      height: 100,
      width: MediaQuery.of(context).size.width/4.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(20)),
          border: Border.all(
              width: 1, color: Colors.grey, style: BorderStyle.solid)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, size: 35,),
          Text(facility, style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

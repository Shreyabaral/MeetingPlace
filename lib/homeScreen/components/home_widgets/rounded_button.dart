import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(8.0),
      disabledColor: Colors.blueAccent,
      //color: Colors.red,
      height: MediaQuery.of(context).size.height/35,
      minWidth: MediaQuery.of(context).size.width/15,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.thumb_up_sharp,
            color: Colors.white,
          ),
          Text(
            "12.5k",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

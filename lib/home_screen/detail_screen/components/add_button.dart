import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: MediaQuery.of(context).size.width/3.5,
      height: MediaQuery.of(context).size.height/15,
      disabledColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add", style: TextStyle(color: Colors.white),),
          SizedBox(
            width: MediaQuery.of(context).size.width/6 ,
          ),
          Text("\$ 15.00", style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}

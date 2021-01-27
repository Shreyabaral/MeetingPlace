import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_place_app/models/meeting_place.dart';
import 'add_button.dart';
import 'cart_counter.dart';
import 'facilities.dart';

class DetailBody extends StatelessWidget {
  final Hits product;

  const DetailBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    product.largeImageURL,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Meeting Place",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "360 Street, NY",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolor sit amet, con Ut enim ad minim veniam, quis nost ea commodo e eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Facilities",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Facilities(
                      icon: Icons.wifi,
                      facility: "Wi-Fi",
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Facilities(
                      icon: Icons.fireplace,
                      facility: "Heater",
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Facilities(
                      icon: Icons.emoji_food_beverage_rounded,
                      facility: "Food",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Facilities(
                      icon: Icons.pregnant_woman_sharp,
                      facility: "Gym",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blueGrey[100],
                      ),
                      child: CartCounter()),
                  SizedBox(
                    width: 10,
                  ),
                  AddButton(),
                ],
              ),
            ],
          )),
    );
  }
}

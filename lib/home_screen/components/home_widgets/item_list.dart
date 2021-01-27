import 'package:flutter/material.dart';
import 'package:meeting_place_app/home_screen/components/home_widgets/rounded_button.dart';
import 'package:meeting_place_app/models/meeting_place.dart';


class ItemList extends StatelessWidget {
  final Hits product;
  final Function press;

  const ItemList({Key key, this.product, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),

          child: Container(
            height: MediaQuery.of(context).size.height / 4.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey[100], Colors.white])),
            padding:
            EdgeInsets.all(MediaQuery.of(context).size.width / 27),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //RoundedButton(),
                Container(
                  child: Stack(
                      alignment: Alignment.bottomRight,
                      overflow: Overflow.visible,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(
                             product.largeImageURL,
                            //"https://pixabay.com/get/g64b82704afa4941447b9720bee4215e796b6906ad8ca1fb3b93f7de635c04bc2c1fb3f7fc90dbdcaf8a09b57b797c65c9075cda4e8801b0c1993ee23295eecee_1280.jpg",
                            width: MediaQuery.of(context).size.width / 4,
                            height:
                            MediaQuery.of(context).size.height / 8,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height / 11,
                          left: MediaQuery.of(context).size.height / 26,
                          child: RoundedButton(),
                        ),
                      ]),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/50,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 12",
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Charming Villa , APMT",
                        style:
                        TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "3200 sq ft | 48HK",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        )
    );
  }
}

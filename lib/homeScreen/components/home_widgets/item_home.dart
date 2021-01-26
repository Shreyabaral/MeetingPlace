import 'package:flutter/material.dart';
import 'package:meeting_place_app/common/loading_indicator.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:meeting_place_app/homeScreen/detail_screen/detail_screen.dart';
import 'package:meeting_place_app/models/meeting_place.dart';

import 'item_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(MediaQuery.of(context).size.width/55),
      height: MediaQuery.of(context).size.height,
      //color: Colors.redAccent,
      child: ItemHome(),
    );
  }
}

class ItemHome extends StatefulWidget {
  @override
  _ItemHomeState createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  final Repository _itemsrepo = Repository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hits>>(
      future: _itemsrepo.fetchImages(),
      builder: (context, snapshot) {
        print("has api data>>>>> ${snapshot.hasData}");

        if (snapshot.hasData) {
          List<Hits> items = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ItemList(
                product: items[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(product: items[index]),
                  ),
                ),
              ),
            ),
          );
          return Text("hello");
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.

        return LoadingIndicator(
            //backgroundColor: Colors.tealAccent,
            // value: 20,
            // strokeWidth: 6,
            );
      },
    );
  }
}

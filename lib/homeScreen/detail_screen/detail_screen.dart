import 'package:flutter/material.dart';
import 'package:meeting_place_app/models/meeting_place.dart';


import 'components/detail_body.dart';
class DetailPage extends StatelessWidget {
  final Hits product;

  const DetailPage({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailBody( product:product),
      ),

    );
  }
}

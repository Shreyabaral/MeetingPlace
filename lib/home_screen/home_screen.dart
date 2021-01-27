import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/home_widgets/heading.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 9,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0.1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            // do something
          },
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search_outlined,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(
              Icons.menu_rounded,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        // actions: [
        //   MyAppBar(
        //
        // )],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,

        child:Stack(

            alignment: Alignment.topCenter,
            children: [

              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/5),
                child: HomeBody(),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,

                  child: Heading()),]),


      ),
    ));
  }
}

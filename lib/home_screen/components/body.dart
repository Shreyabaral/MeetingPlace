import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:meeting_place_app/home_screen/components/home_widgets/item_home.dart';


import 'home_widgets/heading.dart';


class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RepositoryProvider<Repository>(
        create: (context) => Repository(),

        child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Heading(),
                HomeScreen(),
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:meeting_place_app/home_screen/components/home_widgets/item_home.dart';


import '../../bloc/meetingplace/meeting_bloc.dart';
import '../../bloc/meetingplace/meeting_event.dart';
import 'home_widgets/heading.dart';
import 'home_widgets/item_home.dart';


class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingBloc(
        repository: Repository(),
      )..add(MeetingFetchEvent()),

      //body:TempBody(),

      child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width/20),
          child: ItemHome()),




    );
  }
}

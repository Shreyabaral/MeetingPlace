import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_bloc.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_event.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_state.dart';
import 'package:meeting_place_app/common/loading_indicator.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:meeting_place_app/home_screen/detail_screen/detail_screen.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../models/meeting_place.dart';
import 'item_list.dart';



class ItemHome extends StatefulWidget {
  @override
  _ItemHomeState createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  final List<Hits> _beers = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<MeetingBloc, MeetingState>(
        listener: (context, MeetingState) {
          if (MeetingState is MeetingLoadingState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(MeetingState.message)));
          } else if (MeetingState is MeetingSuccessState && MeetingState.meetingPlace.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more beers')));
          } else if (MeetingState is MeetingErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(MeetingState.error)));
            BlocProvider.of<MeetingBloc>(context).isFetching = false;
          }
          return;
        },
        builder: (context, MeetingState) {
          if (MeetingState is MeetingInitialState ||
              MeetingState is MeetingLoadingState && _beers.isEmpty) {
            return CircularProgressIndicator();
          } else if (MeetingState is MeetingSuccessState) {
            _beers.addAll(MeetingState.meetingPlace);
            BlocProvider.of<MeetingBloc>(context).isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (MeetingState is MeetingErrorState && _beers.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<MeetingBloc>(context)
                      ..isFetching = true
                      ..add(MeetingFetchEvent());
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(MeetingState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent &&
                      !BlocProvider.of<MeetingBloc>(context).isFetching) {
                    BlocProvider.of<MeetingBloc>(context)
                      ..isFetching = true
                      ..add(MeetingFetchEvent());
                  }
                }),
              itemCount: _beers.length,
              itemBuilder: (context, index) => ItemList(
                product: (_beers[index]),
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(product: (_beers[index]),
                        ),
                  ),
                ),
                //itemBuilder: (context, index) => BeerListItem(_beers[index]),


              ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

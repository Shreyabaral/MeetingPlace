import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_bloc.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_event.dart';
import 'package:meeting_place_app/bloc/meetingplace/meeting_state.dart';
import 'package:meeting_place_app/common/loading_indicator.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:meeting_place_app/homeScreen/detail_screen/detail_screen.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'item_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: BlocProvider(
        create: (context) => MeetingBloc(),
        child: ItemHome(),
      ),
    );
  }
}

class ItemHome extends StatefulWidget {
  @override
  _ItemHomeState createState() => _ItemHomeState();
}

class _ItemHomeState extends State<ItemHome> {
  MeetingBloc featuredBrandsBloc;
  int _currentMax = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featuredBrandsBloc = MeetingBloc(repository: context.read<Repository>());

    featuredBrandsBloc.add(MeetingLoadEvent());
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => featuredBrandsBloc,
      child:
          BlocConsumer<MeetingBloc, MeetingState>(listener: (context, state) {
        if (state is MeetingLoadingState) {
          showAlertDialog(context);
        }
        if (state is MeetingSuccessState) {
          Navigator.pop(context);
          print(">>>>>>>>>Listener");
        }
      }, builder: (context, state) {
        if (state is MeetingSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: LazyLoadScrollView(
                onEndOfPage: () => getMoreItems(),
                child: ListView.builder(
                  itemCount: _currentMax,
                  itemBuilder: (context, index) => ItemList(
                    product: state.meetingPlace[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(product: state.meetingPlace[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  getMoreItems() {
    setState(() {
      print("Fetch more items");
      for (int i = 1; i <= 5 && _currentMax <20 ; i++) {
        _currentMax = _currentMax + 5;
        print(_currentMax);
      }

    });
  }
}

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';
import 'package:http/http.dart' as http;
import '../../models/meeting_place.dart';
import 'meeting_event.dart';
import 'meeting_state.dart';
import 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  Repository repository;
  int page =1;
  bool isFetching =false;

  MeetingBloc({@required this.repository}) : super(MeetingInitialState()) {

  }

  @override
  Stream<MeetingState> mapEventToState(MeetingEvent event) async* {
    if (event is MeetingFetchEvent) {
      yield MeetingLoadingState(message: 'Loading...');
      final response = await repository.fetchImages(page: page);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final beers = jsonDecode(response.body);
          yield MeetingSuccessState(
            meetingPlace:  MeetingPlace.fromJson(beers).hits,
          );
          page++;
        } else {
          yield MeetingErrorState(error: response.body);
        }
      } else if (response is String) {
        yield MeetingErrorState(error: response);
      }
    }
  }
}


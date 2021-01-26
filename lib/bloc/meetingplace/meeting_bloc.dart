import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meeting_place_app/data/repository/meeting_place_repository.dart';

import 'meeting_event.dart';
import 'meeting_state.dart';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  Repository repository;

  MeetingBloc({@required Repository repository}) : super(null) {
    this.repository = Repository();
  }

  Stream<MeetingState> mapEventToState(MeetingEvent event) async* {
    if (event is MeetingLoadEvent) {
      yield MeetingLoadingState();
      try {
        var banner = await repository.fetchImages();
        yield MeetingSuccessState(banner);
      } catch (e) {
        print(e.toString());
        yield MeetingLoadFailedState();
      }
    }
  }
}

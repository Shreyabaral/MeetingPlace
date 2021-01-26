

import 'package:meeting_place_app/models/meeting_place.dart';

abstract class MeetingState {}

class MeetingInitialState extends MeetingState {}

class MeetingLoadingState extends MeetingState {}

class MeetingSuccessState extends MeetingState {
  final List<Hits> meetingPlace;

  MeetingSuccessState(this.meetingPlace);


}

class MeetingLoadFailedState extends MeetingState {}

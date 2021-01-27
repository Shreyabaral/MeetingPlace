

import 'package:flutter/cupertino.dart';
import 'package:meeting_place_app/models/meeting_place.dart';

abstract class MeetingState {
  const MeetingState();
}

class MeetingInitialState extends MeetingState {
  const MeetingInitialState();
}

class MeetingLoadingState extends MeetingState {
  final String message;
  const MeetingLoadingState({
    @required this.message,
});
}

class MeetingSuccessState extends MeetingState {
  final List<Hits> meetingPlace;

 const MeetingSuccessState({@required this.meetingPlace});


}

class MeetingErrorState extends MeetingState {
  final String error;

  const MeetingErrorState({@required this.error});

}

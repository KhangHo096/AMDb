import 'package:amdb/screens/profile/bloc/profile_event.dart';
import 'package:amdb/screens/profile/bloc/profile_state.dart';
import 'package:bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<UpdateScrollPositionEvent>((event, emit) => {
          emit(UpdateScrollPositionState(
            scrollPosition: event.scrollPosition,
          ))
        });
  }
}

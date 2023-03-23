import 'package:amdb/screens/splash/bloc/splash_event.dart';
import 'package:amdb/screens/splash/bloc/splash_state.dart';
import 'package:amdb/services/repository/search_repository.dart';
import 'package:bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<GetSplashConfigEvent>((event, emit) async {
      await _fetchConfigData();
      emit(GetSplashConfigState(
        name: 'Khang Ho',
      ));
    });
    on<SplashButtonEvent>((event, emit) {
      emit(SplashButtonState(
        text: event.text,
      ));
    });
  }

  String text = '';

  Future<void> _fetchConfigData() async {
    final response = await SearchRepository().search(searchKey: 'Modern family');
  }
}

import 'package:amdb/screens/splash/bloc/splash_event.dart';
import 'package:amdb/screens/splash/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<GetSplashConfigEvent>((event, emit) async {
      await _fetchConfigData();
      emit(GetSplashConfigState(
        name: 'Khang Ho',
      ));
    });
    on<SplashButtonEvent>((event, emit) async {
      emit(SplashButtonState(
        text: event.text,
      ));
    });
  }

  String text = '';

  Future<void> _fetchConfigData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}

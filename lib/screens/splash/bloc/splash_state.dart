abstract class SplashState {}

class SplashInitialState extends SplashState {}

class GetSplashConfigState extends SplashState {
  final String name;

  GetSplashConfigState({
    required this.name,
  });
}

class SplashButtonState extends SplashState {
  final String text;

  SplashButtonState({
    required this.text,
  });
}

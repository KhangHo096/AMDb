abstract class SplashEvent {}

class GetSplashConfigEvent extends SplashEvent {}

class SplashButtonEvent extends SplashEvent {
  final String text;

  SplashButtonEvent({
    required this.text,
  });
}

abstract class ProfileEvent {}

class UpdateScrollPositionEvent extends ProfileEvent {
  final double scrollPosition;

  UpdateScrollPositionEvent({
    required this.scrollPosition,
  });
}



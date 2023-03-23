

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class UpdateScrollPositionState extends ProfileState {
  final double scrollPosition;

  UpdateScrollPositionState({
    required this.scrollPosition,
  });
}

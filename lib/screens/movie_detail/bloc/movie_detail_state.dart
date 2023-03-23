import 'package:palette_generator/palette_generator.dart';

abstract class MovieDetailState {}

class MovieDetailInitialState extends MovieDetailState {}

class UpdateColorPaletteState extends MovieDetailState {
  final PaletteGenerator paletteGenerator;

  UpdateColorPaletteState({
    required this.paletteGenerator,
  });
}

class LoadingState extends MovieDetailState {
}

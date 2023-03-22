import 'package:palette_generator/palette_generator.dart';

abstract class MovieDetailEvent {}

class UpdateColorPaletteEvent extends MovieDetailEvent {
  final String imageUrl;

  UpdateColorPaletteEvent({
    required this.imageUrl,
  });
}


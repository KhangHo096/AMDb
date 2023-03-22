import 'package:amdb/screens/movie_detail/bloc/movie_detail_event.dart';
import 'package:amdb/screens/movie_detail/bloc/movie_detail_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitialState()) {
    on<UpdateColorPaletteEvent>((event, emit) async {
      emit(UpdateColorPaletteState(
        paletteGenerator: await _updatePaletteGenerator(event.imageUrl),
      ));
    });
  }

  String url = 'https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg';
  int _count = 0;
  List<String> posterUrl = [
    'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg',
    'https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg',
    'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_Ratio0.6762_AL_.jpg',
  ];

  void changePoster(){
    _count++;
    if (_count == posterUrl.length) {
      _count = 0;
    }
    url = posterUrl[_count];
    add(UpdateColorPaletteEvent(
      imageUrl: posterUrl[_count],
    ));
  }

  Future<PaletteGenerator> _updatePaletteGenerator(String imageUr) async {
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(
        imageUr,
      ),
      maximumColorCount: 2,
    );
    return paletteGenerator;
  }
}

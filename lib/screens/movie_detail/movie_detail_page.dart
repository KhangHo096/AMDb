part of 'movie_detail.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailBloc>(
      create: (context) => MovieDetailBloc(),
      child: const MovieDetailContainer(),
    );
  }
}

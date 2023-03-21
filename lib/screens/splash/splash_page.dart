part of 'splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(GetSplashConfigEvent()),
      child: const SplashContainer(),
    );
  }
}

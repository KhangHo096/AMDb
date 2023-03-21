part of 'splash.dart';

class SplashContainer extends StatefulWidget {
  const SplashContainer({Key? key}) : super(key: key);

  @override
  State<SplashContainer> createState() => _SplashContainerState();
}

class _SplashContainerState extends State<SplashContainer> {
  late SplashBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SplashBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  BlocBuilder<SplashBloc, SplashState> _buildBody() {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashInitialState) {
          _bloc.text = 'initial state';
        }
        if (state is GetSplashConfigState) {
          _bloc.text = state.name;
        }
        return Center(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  color: Colors.red,
                );
              },
            ),
          ),
        );
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        _bloc.add(
          SplashButtonEvent(text: 'Button is pressed!'),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          String text = 'Splash';
          if (state is SplashButtonState) {
            text = state.text;
          }
          return Text(text);
        },
      ),
    );
  }
}

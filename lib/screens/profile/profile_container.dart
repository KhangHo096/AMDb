part of 'profile.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerContainerState();
}

class _ProfileContainerContainerState extends State<ProfileContainer> {
  late ProfileBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PaletteGenerator? paletteGenerator;
    return Scaffold(
        body: Stack(
        children: [
        Positioned.fill(
            child: Container(
                decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: paletteGenerator?.colors.toList() ??
                  [Colors.white, Colors.white]),
        ))),
        _buildBody(),
          BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UpdateScrollPositionState) {

            }
            return SizedBox(
              height: 90,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                      color: Colors.black12.withOpacity(0.3),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              padding: EdgeInsets.fromLTRB(15, MediaQuery.of(context).viewPadding.top, 0, 0),
                              alignment: Alignment.centerLeft,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              iconSize: 20,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).viewPadding.top),
                              child: const Text(
                                "Movie Detail",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              padding: EdgeInsets.fromLTRB(
                                  0, MediaQuery.of(context).viewPadding.top, 15, 0),
                              alignment: Alignment.centerRight,
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        )
      ],
    ));
  }

  BlocBuilder<ProfileBloc, ProfileState> _buildBody() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            _bloc.add(UpdateScrollPositionEvent(
                scrollPosition: scrollInfo.metrics.pixels));
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.network(
                        'https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_Ratio1.0000_AL_.jpg',
                        height: 600,
                        width: double.infinity,
                        fit: BoxFit.cover),
                    Text(
                      'The Shawshank Redemption',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Image.network(
                    'https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_Ratio1.0000_AL_.jpg',
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.cover),
                Image.network(
                    'https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_Ratio1.0000_AL_.jpg',
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.cover),
                Image.network(
                    'https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_Ratio1.0000_AL_.jpg',
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle _titleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
  }

  TextStyle _normalTextStyle() {
    return const TextStyle(
      color: Colors.white60,
      fontSize: 16,
    );
  }

  TextStyle _smallTextStyle() {
    return const TextStyle(
      color: Colors.white70,
      fontSize: 14,
    );
  }
}

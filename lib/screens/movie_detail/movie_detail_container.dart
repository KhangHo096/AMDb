part of 'movie_detail.dart';

class MovieDetailContainer extends StatefulWidget {
  const MovieDetailContainer({Key? key}) : super(key: key);

  @override
  State<MovieDetailContainer> createState() => _MovieDetailContainerState();
}

class _MovieDetailContainerState extends State<MovieDetailContainer> {
  late MovieDetailBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<MovieDetailBloc>(context);
    _bloc.add(UpdateColorPaletteEvent(imageUrl: _bloc.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PaletteGenerator? paletteGenerator;
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is UpdateColorPaletteState) {
            paletteGenerator = state.paletteGenerator;
          }
          return Stack(
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
              SizedBox(
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
                                padding: EdgeInsets.fromLTRB(
                                    15,
                                    MediaQuery.of(context).viewPadding.top,
                                    0,
                                    0),
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
                                    top:
                                        MediaQuery.of(context).viewPadding.top),
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
                                    0,
                                    MediaQuery.of(context).viewPadding.top,
                                    15,
                                    0),
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
              )
            ],
          );
        },
      ),
    );
  }

  BlocBuilder<MovieDetailBloc, MovieDetailState> _buildBody() {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 105, 20, 20),
                  child: Row(
                    children: [
                      _buildPosterImage(),
                      Expanded(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          height: MediaQuery.of(context).size.height/3.8,
                          child: _buildMovieInfo(),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildButton(),
                _buildOverview(),
                _buildCredits(),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child:  Text("Seasons",style: _titleTextStyle(),)),
                _buildSeasons(),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("Cast",style: _titleTextStyle(),)),
                _buildCastList(),
                _buildSimilarTitle(),
                _buildSimilarList(),
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

  Widget _buildPosterImage() {
    return Expanded(
      flex: 4,
      child: Container(
        height: MediaQuery.of(context).size.height/3.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            _bloc.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  Widget _buildMovieInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Movie Title',
          style: _titleTextStyle(),
        ),
        Text(
          '1963 · 1h 30m · Drama',
          style: _normalTextStyle(),
        ),
        Text(
          '4 Seasons ',
          style: _normalTextStyle(),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/ic_imdb.png',
              width: 30,
            ),
            const SizedBox(width: 8),
            Text(
              '8.1',
              style: _normalTextStyle(),
            ),
          ],
        ),
        RatingBarIndicator(
          rating: 2.75,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 30.0,
          direction: Axis.horizontal,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20,0,20,0),
      child: Row(
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE3A009),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              _bloc.changePoster();
            },
            icon: Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: const Icon(
                Icons.play_arrow,
                size: 24.0,
                color: Color(0xff1E2326),
              ),
            ),
            label: Container(
              padding: const EdgeInsets.fromLTRB(0, 12, 5, 12),
              child: const Text(
                'Play trailer',
                style: TextStyle(
                  color: Color(0xff1E2326),
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.check_circle_outline_outlined,
                  size: 30,
                  color: Colors.white70,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.bookmark_outline_sharp,
                  size: 30,
                  color: Colors.white70,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.ios_share_outlined,
                  size: 30,
                  color: Colors.white70,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20,20,20,0),
        child: Text(
          "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.",
          style: _smallTextStyle(),
        ));
  }

  Widget _buildCredits() {
    List<int> data = [1, 2, 3];
    return Container(
      margin: const EdgeInsets.fromLTRB(20,20,20,20),
      child:
          Column(children: data.map((item) => _buildCreditItem(item)).toList()),
    );
  }

  Widget _buildCreditItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'DIRECTOR',
              style: _smallTextStyle(),
            ),
          ),
          Expanded(
            flex: 11,
            child: Text(
              'Christopher Nolan',
              style: _smallTextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeasons() {
    List<int> seasons = [1, 2, 3, 4];
    return Container(
      margin: const EdgeInsets.all(20),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 20,
        runSpacing: 15,
        children: [
          for (int i = 0; i < seasons.length; i++) _buildSeasonItem(i),
        ],
      ),
    );
  }

  Widget _buildSeasonItem(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 - (80/3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                _bloc.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Season 1',
            style: _normalTextStyle(),
          ),
          Text(
            '8 Episodes',
            style: _smallTextStyle(),
          ),
        ],
      ),
    );
  }

  Widget _buildCastList() {
    List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      height: MediaQuery.of(context).size.width / 4 + 50,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildCastItem(index);
          },
        ),
      ),
    );
  }

  Widget _buildCastItem(int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 4),
              // Leonardo DiCaprio image
              child: index == 0
                  ? Image.network(
                      _bloc.url,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      alignment: Alignment.center,
                      color: Colors.grey,
                      child: const Text(
                        'QL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
            ),
          ),
          Text('Leonardo DiCaprio', style: _normalTextStyle()),
          Text('Himself', style: _smallTextStyle(),),
        ],
      ),
    );
  }

  Widget _buildSimilarTitle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text('Similar',style: _titleTextStyle(),),
          ),
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child:  Text('See all',style: _smallTextStyle(),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarList() {
    List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildSimilarItem(index);
          },
        ),
      ),
    );
  }

  Widget _buildSimilarItem(int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5 - 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                _bloc.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
           Text(
            'The Avenger: End game',
            overflow: TextOverflow.ellipsis,
            style: _normalTextStyle(),
          ),
        ],
      ),
    );
  }
}

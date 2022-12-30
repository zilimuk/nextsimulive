import 'package:flutter/material.dart';
import 'package:simulive/movies/model/movie.dart';
import 'package:simulive/movies/model/trending_movie.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:simulive/movies/movie_controller.dart';
import 'package:simulive/movies/trending_controller.dart';
import 'package:simulive/pages/video_detail_page.dart';
import 'package:simulive/series/model/series.dart';
import 'package:simulive/series/series_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<SeriesList> listSeries;
  late Future<Movie> movies;
  late Future<Movie> myVideoList;
  late Future<TrendingVideo> trendingVideos;
  late Future<StreamingUrl> streamingUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listSeries = fetchSeries();
    movies = fetchMovie();
    // myVideoList = fetchMyList();
    trendingVideos = fetchTrendingVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: listSeries,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final SeriesList series = snapshot.data!;
                          return Stack(
                            children: [
                              Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image: NetworkImage(series.series!.data![2]
                                        .portraitThumbs!.original
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 500,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.85),
                                        Colors.black.withOpacity(0),
                                      ],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                ),
                              ),
                              Container(
                                height: 500,
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Image.network(
                                    //   series.listSeries[2].thumbs.original,
                                    //   width: 250,
                                    // ),
                                    // const SizedBox(
                                    //   height: 15,
                                    // ),
                                    Text(
                                      series.series!.data![2].seriesName
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const VideoDetailPage(
                                        videoUrl:
                                            "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8",
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 13, left: 8, top: 2, bottom: 2),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "info",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "My List",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: movies,
                          builder: (BuildContext context,
                              AsyncSnapshot<Movie> snapshot) {
                            if (snapshot.hasData) {
                              final Movie? listMovies = snapshot.data;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        listMovies!.videos!.data!.length,
                                        (index) {
                                      return FutureBuilder(
                                          future: streamingUrl = fetchVideoLink(
                                              listMovies
                                                  .videos!.data![index].videokey
                                                  .toString()),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              final StreamingUrl?
                                                  videostreaming =
                                                  snapshot!.data;

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              const VideoDetailPage(
                                                                videoUrl:
                                                                    "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8",
                                                              )));
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  width: 110,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          listMovies
                                                              .videos!
                                                              .data![index]
                                                              .thumbs!
                                                              .s1920x1080
                                                              .toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                ),
                                              );
                                            }
                                            return const SizedBox();
                                          });
                                    }),
                                  ),
                                ),
                              );
                            }
                            // return SizedBox();
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Popular on Simulive",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: movies,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final Movie? popularList = snapshot!.data;

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        popularList!.videos!.data!.length,
                                        (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const VideoDetailPage(
                                                          videoUrl:
                                                              "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(popularList
                                                  .videos!
                                                  .data![index]
                                                  .thumbs!
                                                  .original
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Trending now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: trendingVideos,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final TrendingVideo? trending = snapshot.data;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        trending!.videos!.trending!.data!
                                            .length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const VideoDetailPage(
                                                          videoUrl:
                                                              "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(trending
                                                  .videos!
                                                  .trending!
                                                  .data![index]
                                                  .thumbs!
                                                  .original
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Simulive Originals",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: listSeries,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final SeriesList? listSeries = snapshot.data;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        listSeries!.series!.data!.length,
                                        (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const VideoDetailPage(
                                                          videoUrl:
                                                              "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 165,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(listSeries!
                                                  .series!
                                                  .data![index]
                                                  .portraitThumbs!
                                                  .original
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Anime",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FutureBuilder(
                          future: movies,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final Movie? movieList = snapshot.data;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        movieList!.videos!.data!.length,
                                        (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const VideoDetailPage(
                                                          videoUrl:
                                                              "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(movieList!
                                                  .videos!
                                                  .data![index]
                                                  .thumbs!
                                                  .original
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/images/logo.ico",
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          const IconButton(
                              icon: Icon(
                                Icons.collections_bookmark,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: null),
                          IconButton(
                            icon: Image.asset(
                              "assets/images/profile.jpeg",
                              width: 26,
                              height: 26,
                              fit: BoxFit.cover,
                            ),
                            onPressed: null,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "TV Shows",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Movies",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/Auth/auth_controller.dart';
import 'package:simulive/helper/route_helper.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:simulive/movies/movie_controller.dart';
import 'package:simulive/pages/trending_detail_page.dart';
import 'package:simulive/series/series_controller.dart';

import 'movie_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = Get.mediaQuery.size;
    bool _isLoggeIn = Get.find<AuthController>().userLoggedin();
    Future<String> _token = Get.find<AuthController>().getToken();
    var _movieController = Get.find<MovieContoller>();
    var _myList;
    var _category;
    VideoStreaming? _videoStreaming;

    if (_isLoggeIn) {
      // Get.Find<AuthController>().userinfo();

      _movieController.fetchMovies(0, 1, 25, 1);
      _myList = _movieController.getMylistMovie(0, 1, 25, 1);
      _movieController.getFeaturedMovie(1, 25, 1);
      _category = _movieController.getCategory();
    } else {
      // Get.toNamed(RouteHelper.getSignInPage());
      _movieController.fetchMovies(0, 1, 25, 1);
      _movieController.getFeaturedMovie(1, 25, 1);
      _movieController.getTrendingMovie(1, 25, 1);
      _category = _movieController.getCategory();
    }
    Get.find<SeriesController>().getSeriesList(0, 1, 25, 1);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<SeriesController>(builder: (seriesController) {
                    return seriesController.seriesList != null
                        ? Stack(
                            children: [
                              Container(
                                height: 500,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image: NetworkImage(seriesController
                                        .seriesList!
                                        .series!
                                        .data![2]
                                        .thumbs!
                                        .original
                                        .toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 500,
                                width: size.width,
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
                              SizedBox(
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
                                      seriesController.seriesList!.series!
                                          .data![2].seriesName
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        : const Center(
                            child: Text('No data found'),
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
                          // Get.find<MovieContoller>().fetchMoviePlayUrl(videoId)
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
                      _isLoggeIn
                          ? const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "My List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GetBuilder<MovieContoller>(
                            builder: (movieController) {
                          return movieController.videoMyList != null
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        movieController.videoMyList!.data!
                                            .myList!.data!.length, (index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          if (_isLoggeIn) {
                                            VideoStreaming _videoStreaming =
                                                await _movieController
                                                    .fetchMoviePlayUrl(
                                                        movieController
                                                            .movies!
                                                            .videos!
                                                            .data![index]
                                                            .videoid
                                                            .toString());

                                            Get.to(() => MovieDetailPage(
                                                videoUrl: _videoStreaming!
                                                    .data![0].media![0],
                                                movieData: movieController
                                                    .movies!
                                                    .videos!
                                                    .data![index]));
                                          } else {
                                            Get.toNamed(RouteHelper.signIn);
                                          }
                                          // "https://stream2.simulive.co.tz/streamable_videos/2022/09/18/1663424463772nqzvlibga21/1663424463772nqzvlibga21.m3u8?height=1080&userid=1&video_version=2.7&platform=&default_source=2.7",

                                          // Get.to(() => MovieDetailPage(
                                          //     videoUrl:
                                          //         "https://stream2.simulive.co.tz/streamable_videos/2022/09/12/1662999813794agig3g1r8sh2/1662999813794agig3g1r8sh2.m3u8",
                                          //     movieData: movieController
                                          //         .movies!
                                          //         .videos!
                                          //         .data![index]));
                                          //videoUrl:
                                          // "https://bstream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8",
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  movieController
                                                      .videoMyList!
                                                      .data!
                                                      .myList!
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
                                )
                              : const Center(child: Text("No data"));
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Featured on Simulive",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GetBuilder<MovieContoller>(
                            builder: (featuredController) {
                          return featuredController.featuredVideo != null
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        featuredController.featuredVideo!
                                            .videos!.featured!.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => MovieDetailPage(
                                              videoUrl: featuredController
                                                  .movies!
                                                  .videos!
                                                  .data![index]
                                                  .gif
                                                  .toString(),
                                              movieData: featuredController
                                                  .movies!
                                                  .videos!
                                                  .data![index]));
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (_) => const VideoDetailPage(
                                          //             videoUrl:
                                          //                 "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  featuredController
                                                      .featuredVideo!
                                                      .videos!
                                                      .featured![index]
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
                                )
                              : const Center(
                                  child: Text('No data found'),
                                );
                        }),
                      ),
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
                      GetBuilder<MovieContoller>(builder: (trendingController) {
                        return trendingController.trendingVideo != null
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        trendingController
                                            .trendingVideo!
                                            .videos!
                                            .trending!
                                            .data!
                                            .length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => TrendingDetailPage(
                                              videoUrl: trendingController
                                                  .trendingVideo!
                                                  .videos!
                                                  .trending!
                                                  .data![index]
                                                  .gif
                                                  .toString(),
                                              movieData: trendingController
                                                  .trendingVideo!
                                                  .videos!
                                                  .trending!
                                                  .data![index]));
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (_) =>
                                          //             const VideoDetailPage(
                                          //                 videoUrl:
                                          //                     "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 110,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  trendingController
                                                      .trendingVideo!
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
                              )
                            : const Center(
                                child: Text('No data found'),
                              );
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Simulive Series",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: GetBuilder<SeriesController>(
                            builder: (seriesController) {
                          return seriesController.seriesList != null
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: List.generate(
                                        seriesController.seriesList!.series!
                                            .data!.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (_) => const VideoDetailPage(
                                          //             videoUrl:
                                          //                 "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 165,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  seriesController
                                                      .seriesList!
                                                      .series!
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
                                )
                              : const Center(
                                  child: Text('No data found'),
                                );
                        }),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<MovieContoller>(builder: (categoryController) {
                        return categoryController.videoCategories != null
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: List.generate(
                                      categoryController
                                          .videoCategories!.categories!.length,
                                      (index) {
                                        return categoryController
                                                    .videoCategories!
                                                    .categories![index]
                                                    .navbar ==
                                                "yes"
                                            ? Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Text(
                                                          categoryController
                                                              .videoCategories!
                                                              .categories![
                                                                  index]
                                                              .categoryName!
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  const SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10),
                                                      )),
                                                ],
                                              )
                                            : Container();
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                    ],
                  ),
                ],
              ),
            ),
            SafeArea(
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
          ],
        ),
      ),
    );
  }
}

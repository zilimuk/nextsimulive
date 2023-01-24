// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/Auth/auth_controller.dart';
import 'package:simulive/helper/route_helper.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:simulive/movies/movie_controller.dart';
import 'package:simulive/pages/featured_detail_page.dart';
import 'package:simulive/pages/movie_by_category_detail_page.dart';
import 'package:simulive/pages/mylist_detail_page.dart';
import 'package:simulive/pages/trending_detail_page.dart';
import 'package:simulive/series/series_controller.dart';

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
    var _movieController = Get.find<MovieController>();
    var _myList;
    var _category;
    VideoStreaming? _videoStreaming;

    if (_isLoggeIn) {
      // Get.Find<AuthController>().userinfo();

      //  var _movies =  _movieController.fetchMovies(0, 1, 25, 1);
    } else {
      // Get.toNamed(RouteHelper.getSignInPage());
    }

    var _movies = _movieController.fetchMovies(0, 1, 25, 1);
    _movieController.getFeaturedMovie(1, 25, 1);
    _movieController.getTrendingMovie(1, 25, 1);
    _category = _movieController.getCategory();
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
                              SizedBox(
                                  height: 500,
                                  width: size.width,
                                  child: CachedNetworkImage(
                                    imageUrl: seriesController.seriesList!
                                        .series!.data![2].thumbs!.original
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Color.fromARGB(
                                                    255, 252, 252, 252),
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )),
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
                          if (_isLoggeIn) {
                            //  Get.find<MovieController>().fetchMoviePlayUrl(videoId)
                          } else {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
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
                        child: GetBuilder<MovieController>(
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
                                                            .videoMyList!
                                                            .data!
                                                            .myList!
                                                            .data![index]
                                                            .videoid!
                                                            .toString());

                                            Get.to(() => MyListDetailPage(
                                                movieData: movieController
                                                    .videoMyList!
                                                    .data!
                                                    .myList!
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
                                          child: CachedNetworkImage(
                                            imageUrl: movieController
                                                .videoMyList!
                                                .data!
                                                .myList!
                                                .data![index]
                                                .thumbs!
                                                .original
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color.fromARGB(255,
                                                                252, 252, 252),
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                        child: GetBuilder<MovieController>(
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
                                          Get.to(() => FeaturedDetailPage(
                                              movieData: featuredController
                                                  .featuredVideo!
                                                  .videos!
                                                  .featured![index]));
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
                                          child: CachedNetworkImage(
                                            imageUrl: featuredController
                                                .featuredVideo!
                                                .videos!
                                                .featured![index]
                                                .thumbs!
                                                .original
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color.fromARGB(255,
                                                                252, 252, 252),
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                      GetBuilder<MovieController>(
                          builder: (trendingController) {
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
                                          child: CachedNetworkImage(
                                            imageUrl: trendingController
                                                .trendingVideo!
                                                .videos!
                                                .trending!
                                                .data![index]
                                                .thumbs!
                                                .original
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color.fromARGB(255,
                                                                252, 252, 252),
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                                          child: CachedNetworkImage(
                                            imageUrl: seriesController
                                                .seriesList!
                                                .series!
                                                .data![index]
                                                .thumbs!
                                                .original
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color.fromARGB(255,
                                                                252, 252, 252),
                                                            BlendMode
                                                                .colorBurn)),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                      GetBuilder<MovieController>(
                        builder: (movieController) {
                          return movieController.moviesInCategory != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    movieController.moviesInCategory!.length,
                                    (index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 10,
                                                bottom: 10),
                                            child: Text(
                                              movieController
                                                  .moviesInCategory![index]
                                                  .category
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                children: List.generate(
                                                    movieController
                                                        .moviesInCategory![
                                                            index]
                                                        .data!
                                                        .length, (indexy) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Get.to(() => MovieByCategoryDetailPage(
                                                          movieData: movieController
                                                              .moviesInCategory![
                                                                  index]
                                                              .data![indexy]));
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (_) =>
                                                      //             const VideoDetailPage(
                                                      //                 videoUrl:
                                                      //                     "https://stream.simulive.co.tz/streamable_videos/2022/08/09/1659973358Be44OPvWKl/1659973358Be44OPvWKl.m3u8")));
                                                    },
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 8),
                                                        width: 110,
                                                        height: 160,
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: movieController
                                                              .moviesInCategory![
                                                                  index]
                                                              .data![indexy]
                                                              .thumbs!
                                                              .original
                                                              .toString(),
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  colorFilter: const ColorFilter
                                                                          .mode(
                                                                      Color.fromARGB(
                                                                          255,
                                                                          252,
                                                                          252,
                                                                          252),
                                                                      BlendMode
                                                                          .colorBurn)),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        )),
                                                  );
                                                }),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              : Container();
                        },
                      )
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

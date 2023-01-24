import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/json/video_detail_json.dart';
import 'package:simulive/movies/model/category_videos.dart';
import 'package:simulive/movies/movie_controller.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final List<MovieController>? movieContollers;
  const VideoDetailPage({super.key, this.movieContollers});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  // late VideoPlayerController _controller;
  late CategoryData _movieData;
  CategoryData get movieData => _movieData;
  int activeMenu = 0;
  // @override
  // void initState() {
  //   // ignore: todo
  //   super.initState();
  //   _controller = VideoPlayerController.network(widget.videoUrl)
  //     ..initialize().then((_) {
  //       setState(() {
  //         _controller.play();
  //       });
  //     });
  // }

  // @override
  // void dispose() {
  //   // ignore: todo
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        const IconButton(
          icon: Icon(
            Icons.collections_bookmark,
            size: 28,
            color: Colors.white,
          ),
          onPressed: null,
        ),
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
    );
  }

  Widget getBody() {
    Get.find<MovieController>().getRelatedVideos(
        movieData.categories![0].categoryId!.toInt(),
        movieData.videoid!.toInt(),
        1,
        10,
        1);
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(children: [
        SizedBox(
          height: size.height * 0.22,
          width: size.width,
          child: Stack(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: movieData.gif.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Color.fromARGB(255, 252, 252, 252),
                              BlendMode.colorBurn)),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              // AspectRatio(
              //     aspectRatio: _controller.value.aspectRatio,
              //     child:
              //         // BetterPlayer.network(widget.videoUrl)),
              //         VideoPlayer(_controller)),
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              ),
              // Center(
              //   child: IconButton(
              //     icon: Icon(
              //         _controller.value.isPlaying ? null : Icons.play_arrow,
              //         color: Colors.white,
              //         size: 50),
              //     onPressed: () {
              //       setState(() {
              //         _controller.value.isPlaying
              //             ? _controller.pause()
              //             : _controller.play();
              //       });
              //     },
              //   ),
              // ),
              Positioned(
                left: 5,
                bottom: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 13, top: 8, bottom: 8),
                    child: Row(
                      children: const [
                        Text(
                          "Preview",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 6,
                bottom: 20,
                child: Container(
                  width: 30,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.volume_off,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: size.height * .64,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieData.title.toString(),
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        movieData.contentTypeLabel.toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        movieData.year.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 4, bottom: 4),
                          child: Text(
                            movieData.maturityLevel == "all"
                                ? movieData.maturityLevel.toString()
                                : "${movieData.maturityLevel}+",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        movieData.categories![0].categoryName.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.5)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 6, right: 6, top: 4, bottom: 4),
                          child: Text(
                            movieData.quality!.hd.toString() == "yes"
                                ? 'HD'
                                : 'UHD',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${movieData.title}",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Download",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    movieData.title.toString(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: (size.width - 30) * 0.75,
                        child: Stack(
                          children: [
                            Container(
                              width: (size.width - 30) * 0.75,
                              height: 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            Container(
                              width: (size.width - 30) * 0.2,
                              height: 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${movieData.interval}",
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    movieData.description.toString() != ""
                        ? movieData.categories![0].categoryDesc.toString()
                        : movieData.categories![0].categoryDesc.toString(),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), height: 1.4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    movieData.description.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.withOpacity(0.9),
                        height: 1.4),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: List.generate(likesList.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Column(
                          children: [
                            Icon(
                              likesList[index]['icon'],
                              color: Colors.white.withOpacity(0.9),
                              size: 25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              likesList[index]['text'],
                              style: TextStyle(
                                  fontSize: 12,
                                  height: 1.4,
                                  color: Colors.grey.withOpacity(0.9)),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          movieData.seasonId != 0
                              ? episodesList.length
                              : movieMore.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu = index;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: activeMenu == index
                                          ? const Border(
                                              top: BorderSide(
                                                  color: Colors.red, width: 4),
                                            )
                                          : null),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      movieData.seasonId != 0
                                          ? episodesList[index]
                                          : movieMore[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: activeMenu == index
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  movieData.seasonId != 0
                      ? Text(
                          "Season 1",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w500),
                        )
                      : Container(),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<MovieController>(builder: (movieController) {
                    return movieController.relatedVideos != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: List.generate(
                                    movieController.relatedVideos!.data!.length,
                                    (indexr) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: (size.width - 30) * 0.85,
                                              height: 100,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 150,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            // image: DecorationImage(
                                                            //     image: AssetImage(movieController
                                                            //         .relatedVideos!
                                                            //         .data![
                                                            //             indexr]
                                                            //         .thumbs!
                                                            //         .original
                                                            //         .toString()),
                                                            //     fit: BoxFit
                                                            //         .cover),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: movieController
                                                                  .relatedVideos!
                                                                  .data![indexr]
                                                                  .thumbs!
                                                                  .original
                                                                  .toString(),
                                                              imageBuilder:
                                                                  (context,
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
                                                              progressIndicatorBuilder: (context,
                                                                      url,
                                                                      downloadProgress) =>
                                                                  CircularProgressIndicator(
                                                                      value: downloadProgress
                                                                          .progress),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150,
                                                          height: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 30,
                                                          left: 57,
                                                          child: Container(
                                                            width: 38,
                                                            height: 38,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.4),
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .white)),
                                                            child: const Center(
                                                              child: Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: (size.width) * 0.35,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            movieController
                                                                .relatedVideos!
                                                                .data![indexr]
                                                                .title
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                height: 1.3,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.9)),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          Text(
                                                            movieController
                                                                .relatedVideos!
                                                                .data![indexr]
                                                                .duration
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                height: 1.3,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: (size.width - 30) * 0.15,
                                              height: 100,
                                              child: Center(
                                                child: Icon(
                                                  Icons.file_download,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          movieController.relatedVideos!
                                              .data![indexr].description
                                              .toString(),
                                          style: TextStyle(
                                            height: 1.4,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )
                        : Container();
                  }),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

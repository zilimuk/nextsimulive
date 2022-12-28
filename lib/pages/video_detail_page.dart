import 'package:flutter/material.dart';
import 'package:simulive/json/video_detail_json.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;
  const VideoDetailPage({super.key, required this.videoUrl});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late VideoPlayerController _controller;
  int activeMenu = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

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
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(children: [
        Container(
          height: 220,
          child: Stack(
            children: [
              AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller)),
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                      _controller.value.isPlaying ? null : Icons.play_arrow,
                      color: Colors.white,
                      size: 50),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                ),
              ),
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
                right: 5,
                bottom: 20,
                child: Container(
                  width: 25,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.volume_mute,
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
        Container(
          height: size.height - 340,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Age of Sumuria: Battle for Japan",
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
                      const Text(
                        "New",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "2021",
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 6, right: 6, top: 4, bottom: 4),
                          child: Text(
                            "18+",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "1 Season",
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 6, right: 6, top: 4, bottom: 4),
                          child: Text(
                            "HD",
                            style: TextStyle(
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
                    "Watch Season 1 now",
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
                            "Resume",
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
                    "S1:E1 The Rise of Nobunaga",
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
                      Container(
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
                      const Text(
                        "35 remaining",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "cvsd bsa nbs bsn fvvsbvsvvsv s vsb vfhsbv sshvhsvjsvgsvf",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), height: 1.4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Cast:  ndndsjdns fnsjnfsjnf fsjns",
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
                      children: List.generate(episodesList.length, (index) {
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
                                      episodesList[index],
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
                  Text(
                    "Season 1",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: List.generate(movieList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: (size.width - 30) * 0.85,
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              movieList[index]
                                                                  ['img']),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Container(
                                                  width: 150,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 30,
                                                  left: 57,
                                                  child: Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        border: Border.all(
                                                            width: 2,
                                                            color:
                                                                Colors.white)),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.play_arrow,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: (size.width) * 0.35,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    movieList[index]['title'],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        height: 1.3,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white
                                                            .withOpacity(0.9)),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    movieList[index]
                                                        ['duration'],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        height: 1.3,
                                                        color: Colors.white
                                                            .withOpacity(0.5)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: (size.width - 30) * 0.15,
                                      height: 100,
                                      child: Center(
                                        child: Icon(
                                          Icons.file_download,
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  movieList[index]['description'],
                                  style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
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

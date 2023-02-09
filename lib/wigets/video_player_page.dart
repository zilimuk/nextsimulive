import 'dart:html';

import 'package:flutter/material.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:screens/screens.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoStreaming videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isPlaying = true;
  double _volume = 1.0;
  double _speed = 1.0;
  String _resolution = "1080p";

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _videoPlayerController =
        VideoPlayerController.network(widget.videoUrl.data![0].media![0]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      allowedScreenSleep: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSizeStream;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                    if (_isPlaying) {
                      _videoPlayerController.play();
                    } else {
                      _videoPlayerController.pause();
                    }
                  });
                },
                child: Stack(
                  children: [
                    Chewie(
                      controller: _chewieController,
                    ),
                    _isPlaying
                        ? Container()
                        : Container(
                            color: Colors.black26,
                            child: const Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 60.0,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.fast_rewind),
                    onPressed: () {
                      setState(() {
                        int position =
                            _videoPlayerController.value.position.inSeconds;
                        _videoPlayerController
                            .seekTo(Duration(seconds: position - 10));
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fast_forward),
                    onPressed: () {
                      setState(() {
                        int position =
                            _videoPlayerController.value.position.inSeconds;
                        _videoPlayerController
                            .seekTo(Duration(seconds: position + 10));
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Resolution:"),
                  DropdownButton<String>(
                    value: _resolution,
                    items: ["720p", "1080p", "2K", "4K"]
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _resolution = newValue!;
                      });
// implement the logic to switch to different resolutions here
                    },
                  ),
                  const Text("Speed:"),
                  DropdownButton<double>(
                    value: _speed,
                    items: [0.5, 0.75, 1.0, 1.25, 1.5, 2.0]
                        .map((double value) => DropdownMenuItem<double>(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    onChanged: (double? newValue) {
                      setState(() {
                        _speed = newValue!;
                        _videoPlayerController.setPlaybackSpeed(_speed);
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Volume:"),
                  Container(
                    width: 200.0,
                    child: Slider(
                      value: _volume,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (double newValue) {
                        setState(() {
                          _volume = newValue;
                          _videoPlayerController.setVolume(_volume);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Network Strength:"),
                  StreamBuilder<ConnectivityResult>(
                    stream: Connectivity().onConnectivityChanged,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var result = snapshot.data;
                        if (result == ConnectivityResult.none) {
                          return const Text("No internet connection");
                        } else if (result == ConnectivityResult.mobile) {
                          return const Text("Mobile network");
                        } else if (result == ConnectivityResult.wifi) {
                          return const Text("Wifi network");
                        }
                      }
                      return const Text("Unknown");
                    },
                  ),
                  const Text("Screen Size:"),
                  StreamBuilder<Size>(
                    stream: Screens,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var size = snapshot.data;
                        return Text("${size!.width} x ${size.height}");
                      }
                      return Text("Unknown");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

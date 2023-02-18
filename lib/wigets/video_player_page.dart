import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simulive/movies/model/video_streaming.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoStreaming videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreen createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _showIcons = false;
  bool _isNormalScreen = true;
  double _fullScreenleft = 0.1;
  double _fullScreenTop = 0.4;
  double _playerLeft = 0.4;
  double _playerTop = 0.45;

  @override
  void initState() {
    super.initState();
    _showIcons = true;
    _normalScreen();
    _controller =
        VideoPlayerController.network(widget.videoUrl.data![0].media!.first)
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _normalScreen();
    _controller.dispose();

    super.dispose();
  }

  void _normalScreen() {
    if (mounted) {
      setState(() {
        _isNormalScreen = true;

        _fullScreenleft = 0;
        _fullScreenTop = 0.355;
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      });
    }
  }

  void _fullScreen() {
    if (mounted) {
      setState(() {
        _isNormalScreen = false;

        _fullScreenleft = 0;
        _fullScreenTop = 0;
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _showIcons = true;
              Future.delayed(const Duration(seconds: 2), () {
                if (mounted) {
                  setState(() {
                    _showIcons = false;
                  });
                }
              });
            });
          },
          child: Center(
            child: _controller.value.isInitialized
                ? Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: SizedBox(
                                    width: _controller.value.size.width,
                                    height: _controller.value.size.height,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_showIcons)
                        Positioned(
                          left: Get.width * _playerLeft,
                          top: Get.height * _playerTop,
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black38,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      if (_showIcons)
                        Positioned(
                            left: Get.width * _fullScreenleft,
                            top: Get.height * _fullScreenTop,
                            child: Stack(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    _isNormalScreen == true
                                        ? Icons.fullscreen
                                        : Icons.fullscreen_exit,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isNormalScreen == false
                                          ? _normalScreen()
                                          : _fullScreen();
                                    });
                                  },
                                ),
                              ],
                            ))
                    ],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}

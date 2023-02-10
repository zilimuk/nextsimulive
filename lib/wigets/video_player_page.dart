import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:simulive/movies/model/video_streaming.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoStreaming videoUrl;
  const VideoPlayerScreen({super.key, required this.videoUrl});
  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreen createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late final BetterPlayerController _betterPlayerController;
  final GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl.data![0].media!.first,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: true,
        preCacheSize: 10 * 1024 * 1024,
        maxCacheSize: 10 * 1024 * 1024,
        maxCacheFileSize: 10 * 1024 * 1024,

        ///Android only option to use cached video between app sessions
        // key: "testCacheKey",
      ),
      // bufferingConfiguration: const BetterPlayerBufferingConfiguration(
      //   minBufferMs: 50000,
      //   maxBufferMs: 13107200,
      //   bufferForPlaybackMs: 2500,
      //   bufferForPlaybackAfterRebufferMs: 5000,
      // ),
    );

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        fit: BoxFit.contain,
        handleLifecycle: true,
        autoPlay: true,
        fullScreenByDefault: false,
        looping: true,
        showPlaceholderUntilPlay: true,
        autoDetectFullscreenAspectRatio: false,
        autoDispose: false,
        // deviceOrientationsAfterFullScreen: [
        //   DeviceOrientation.landscapeLeft,
        //   DeviceOrientation.landscapeRight
        // ],
        controlsConfiguration: BetterPlayerControlsConfiguration(
          progressBarHandleColor: Color.fromARGB(255, 255, 0, 0),
          progressBarPlayedColor: Color.fromARGB(255, 255, 0, 0),
          loadingColor: Color.fromARGB(255, 255, 0, 0),
          showControlsOnInitialize: true,
          enableOverflowMenu: true,
          enablePip: true,
          enableFullscreen: true,

          // overflowMenuCustomItems: [
          //   BetterPlayerOverflowMenuItem(
          //     Icons.account_circle_rounded,
          //     "Custom element",
          //     () => print("Click!"),
          //   )
          // ],
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
    // _betterPlayerController!
    //     .setupDataSource(betterPlayerDataSource)
    //     .then((response) {
    //   // Source loaded successfully
    //   videoLoading = false;
    // }).catchError((error) async {
    //   // Source did not load, url might be invalid
    //   inspect(error);
    // });
    _betterPlayerController.isPictureInPictureSupported();
    _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
    _betterPlayerController.preCache(betterPlayerDataSource);
    _betterPlayerController.setOverriddenAspectRatio(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayerMultipleGestureDetector(
      onTap: (() {}),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          controller: _betterPlayerController,
          key: _betterPlayerKey,
        ),
      ),
    );
  }
}

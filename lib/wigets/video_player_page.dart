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
        key: "testCacheKey",
      ),
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
        minBufferMs: 50000,
        maxBufferMs: 13107200,
        bufferForPlaybackMs: 2500,
        bufferForPlaybackAfterRebufferMs: 5000,
      ),
    );
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
            autoPlay: true,
            fullScreenByDefault: true,
            looping: true,
            showPlaceholderUntilPlay: true,
            autoDetectFullscreenAspectRatio: true),
        betterPlayerDataSource: betterPlayerDataSource);

    _betterPlayerController.preCache(betterPlayerDataSource);
  }

  @override
  void dispose() {
    // ignore: todo
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }
}

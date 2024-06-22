import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final List<String> anim;
  const VideoPlayerWidget({super.key, required this.anim});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  int _currentIndex = 0;
  late List<String> _videos;

  @override
  void initState() {
    super.initState();
    _videos = widget.anim;
    _initializeAndPlay(_videos[_currentIndex]);
  }

  Future<void> _initializeAndPlay(String videoPath) async {
    _controller = VideoPlayerController.asset(videoPath)
      ..addListener(() {
        if (_controller!.value.position == _controller!.value.duration) {
          _playNextVideo();
        }
      })
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
      });
  }

  void _playNextVideo() {
    if (_currentIndex < _videos.length - 1) {
      _currentIndex++;
      _controller!.dispose();
      _initializeAndPlay(_videos[_currentIndex]);
    } else {
      _currentIndex = 0;
      _controller!.dispose();
      _initializeAndPlay(_videos[_currentIndex]);
    }
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.anim != widget.anim) {
      _videos = widget.anim;
      _currentIndex = 0;
      _controller?.dispose();
      _initializeAndPlay(_videos[_currentIndex]);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller != null && _controller!.value.isInitialized
        ? FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: _controller!.value.size.width,
        height: _controller!.value.size.height,
        child: VideoPlayer(_controller!),
      ),
    )
        : const Center(child: CircularProgressIndicator());
  }
}

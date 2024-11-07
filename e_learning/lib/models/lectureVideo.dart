import 'package:e_learning/models/lecture.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:e_learning/data_provider/course_data_provider.dart';



class LectureVideo extends StatefulWidget {
  final String videoUrl;

  LectureVideo(this.videoUrl);
  @override
  _LectureVideoState createState() => _LectureVideoState();
}

class _LectureVideoState extends State<LectureVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();  // Auto-play video when ready
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_seventh/controllers/video_controller.dart';
import 'package:teste_seventh/utils/local_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // Controller's video
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  // My video Controller
  final _myVideoController = Modular.get<VideoController>();

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  // This function get url, put on videoPlayerController and start the video
  void _initPlayer() async {
    await _myVideoController.getUrl().whenComplete(() {
      setState(() {
        _myVideoController.loadingCompleted = true;
      });
    });
    final videoPlayerController =
        VideoPlayerController.network(_myVideoController.url);
    await videoPlayerController.initialize().whenComplete(() {
      setState(() {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: false,
          looping: true,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Video App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: !_myVideoController.loadingCompleted
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : chewieController != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
                  child: Chewie(
                    controller: chewieController!,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }

  @override
  void dispose() async {
    super.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
    await LocalStorage.removeAllSave();
  }
}

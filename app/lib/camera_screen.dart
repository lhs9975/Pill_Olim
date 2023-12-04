import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gpt_pill_03/image_display_screen.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.ultraHigh);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void _onCapturePressed() async {
    try {
      final image = await controller.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageDisplayScreen(imagePath: image.path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // 여기서 여백을 조절합니다
          child: ElevatedButton(
            onPressed: _onCapturePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 62, 196, 66),
              minimumSize: Size(100, 60), // ElevatedButton의 최소 크기를 설정
            ),
            child: const Icon(
              Icons.camera,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}

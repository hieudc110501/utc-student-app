import 'dart:async';
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen_controller.dart';
import 'package:utc_student_app/utils/color.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (_controller?.update(text) ?? false) {
      return;
    } else {
      _controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final state = Overlay.of(context);
    // ignore: unnecessary_null_comparison
    if (state == null) {
      return null;
    }

    //add status text into StreamController
    final textController = StreamController<String>();
    textController.add(text);

    //create overlay
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.white.withAlpha(50),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const CircularProgressIndicator(
                  color: blue700,
                ),
                const SizedBox(height: 10),
                StreamBuilder<String>(
                  stream: textController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.requireData,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: grey700,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingScreenController(close: () {
      textController.close();
      overlay.remove();
      return true;
    }, update: (text) {
      textController.add(text);
      return true;
    });
  }
}

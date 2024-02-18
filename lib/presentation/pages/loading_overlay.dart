import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Container(
            color: Colors.white.withOpacity(0.5),
          ),
          const Center(
            child: CupertinoActivityIndicator(radius: 20),
          ),
        ],
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
  }
}

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.white.withOpacity(0.5),
        child: const Center(
          child: CupertinoActivityIndicator(radius: 20),
        ),
      ),
    );
  }
}

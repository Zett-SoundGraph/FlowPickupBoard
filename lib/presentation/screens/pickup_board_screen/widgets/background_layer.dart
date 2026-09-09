import 'package:flutter/material.dart';

import 'package:pickup_board/core/constants/index.dart';

/// Full-bleed marketing background — always fills the canvas; the
/// Preparing/Ready cards sit on top of it and cover however much of it their
/// row count needs.
class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        AssetPaths.backgroundImage,
        fit: BoxFit.cover,
        // Without this, a decode/load failure silently renders nothing at
        // all (indistinguishable from "just hasn't loaded yet") — logging
        // the actual error is what tells them apart.
        errorBuilder: (context, error, stackTrace) {
          debugPrint('[BackgroundLayer] Failed to load ${AssetPaths.backgroundImage}: $error');
          return Container(color: Theme.of(context).scaffoldBackgroundColor);
        },
      ),
    );
  }
}

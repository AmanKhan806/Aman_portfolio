import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class CustomConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;
  final double emissionFrequency;
  final int numberOfParticles;
  final double maxBlastForce;
  final double minBlastForce;
  final BlastDirectionality blastDirectionality;
  final double blastDirection;
  final double gravity;
  final bool shouldLoop;
  final bool displayTarget;
  final List<Color>? colors;
  final Color strokeColor;
  final double strokeWidth;
  final Size minimumSize;
  final Size maximumSize;
  final double particleDrag;
  final CustomPainter? canvas;
  final bool pauseEmissionOnLowFrameRate;
  final Path Function(Size size)? createParticlePath;

  const CustomConfettiWidget({
    super.key,
    required this.confettiController,
    this.emissionFrequency = 0.02,
    this.numberOfParticles = 10,
    this.maxBlastForce = 20,
    this.minBlastForce = 5,
    this.blastDirectionality = BlastDirectionality.directional,
    this.blastDirection = pi,
    this.gravity = 0.2,
    this.shouldLoop = false,
    this.displayTarget = false,
    this.colors,
    this.strokeColor = Colors.black,
    this.strokeWidth = 0,
    this.minimumSize = const Size(20, 10),
    this.maximumSize = const Size(30, 15),
    this.particleDrag = 0.05,
    this.canvas,
    this.pauseEmissionOnLowFrameRate = true,
    this.createParticlePath,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: confettiController,
        emissionFrequency: emissionFrequency,
        numberOfParticles: numberOfParticles,
        maxBlastForce: maxBlastForce,
        minBlastForce: minBlastForce,
        blastDirectionality: blastDirectionality,
        blastDirection: blastDirection,
        gravity: gravity,
        shouldLoop: shouldLoop,
        displayTarget: displayTarget,
        colors: colors,
        strokeColor: strokeColor,
        strokeWidth: strokeWidth,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        particleDrag: particleDrag,
        pauseEmissionOnLowFrameRate: pauseEmissionOnLowFrameRate,
        createParticlePath: createParticlePath,
      ),
    );
  }
}

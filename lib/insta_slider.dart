import 'package:flutter/material.dart';

class InstaSlider extends StatefulWidget {
  const InstaSlider({super.key});

  @override
  State<InstaSlider> createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<InstaSlider> {
  // Track the horizontal position of the slider knob (starts at 0)
  double _sliderPosition = 0.0;
  final double _trackWidth = 250.0;
  final double _knobSize = 30.0;

  @override
  Widget build(BuildContext context) {
    // Calculate percentages for effects (0.0 to 1.0)
    double percentage = _sliderPosition / (_trackWidth - _knobSize);

    return Scaffold(
      backgroundColor: Colors.black, // Dark background like Instagram stories
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Target reaction that grows as you slide
            Text('🔥', style: TextStyle(fontSize: 30 + (percentage * 60))),
            const SizedBox(height: 40),

            // The Slider Track
            GestureDetector(
              // Handles the sliding movement
              onPanUpdate: (details) {
                setState(() {
                  // Update position based on finger movement
                  _sliderPosition += details.delta.dx;

                  // Keep the slider knob inside the boundaries
                  if (_sliderPosition < 0) {
                    _sliderPosition = 0;
                  } else if (_sliderPosition > (_trackWidth - _knobSize)) {
                    _sliderPosition = _trackWidth - _knobSize;
                  }
                });
              },
              child: Container(
                width: _trackWidth,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // Moving Knob
                    Positioned(
                      left: _sliderPosition,
                      top: 5,
                      child: Container(
                        width: _knobSize,
                        height: _knobSize,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 4),
                          ],
                        ),
                        child: const Center(
                          child: Text('❤️', style: TextStyle(fontSize: 14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

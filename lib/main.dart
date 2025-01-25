import 'dart:math'; // For mathematical constants (e.g., pi)
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// A StatefulWidget that hosts the rotating animation.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// The state class for [HomePage], managing the animation lifecycle.
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController; // Controls animation timing
  late final Animation<double> _rotationAnimation; // Defines rotation range

  @override
  void initState() {
    super.initState();

    // Initialize animation controller with a 2-second duration
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // Syncs animation with screen refresh rate
    );

    // Configure rotation animation (0 to 360 degrees in radians)
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      _rotationController,
    );

    // Start repeating the animation indefinitely
    _rotationController.repeat();
  }

  @override
  void dispose() {
    // Clean up the controller to prevent memory leaks
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _rotationController,
          builder: (context, child) {
            return Transform(
              // Rotate around the Z-axis (perpendicular to the screen)
              transform: Matrix4.identity()..rotateZ(_rotationAnimation.value),
              alignment: Alignment.center, // Pivot point for rotation
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5), // Shadow styling
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
# Flutter Rotation Animation Demo

![Flutter Version](https://img.shields.io/badge/Flutter-3.22-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A clean and efficient implementation of a continuous rotation animation in Flutter using `AnimationController` and matrix transformations.

## Features

- 🌀 **Smooth 360° Rotation**: Uses `Matrix4.rotateZ` for fluid animation.
- ⚡ **Performance Optimized**: Leverages Flutter's animation system with `vsync`.
- 🎨 **Customizable Design**: Easily modify the rotating widget's appearance.

## Technical Breakdown

### Core Components
1. **AnimationController**: Manages animation duration and state.
2. **Tween**: Generates values between `0` and `2π` radians (full rotation).
3. **AnimatedBuilder**: Rebuilds widget tree efficiently during animation.
4. **Matrix4 Transform**: Applies 3D rotation around the Z-axis.

### Key Concepts
- **Radians vs Degrees**: Flutter uses radians for rotation calculations (`2π` radians = 360°).
- **vsync**: Synchronizes animation with screen refresh rate (60 FPS by default).
- **Transform Layer**: Uses Skia's hardware-accelerated graphics engine.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter-rotation-animation.git


   

<video src="https://github.com/user-attachments/assets/3889146d-9c01-4016-b7d4-f243efbd7c1b" 
       width="500" 
       height="350" 
       controls>
</video>

# Flutter Stepper Widget Demo

A simple Flutter app demonstrating the Stepper widget through a realistic account setup flow.

## How to Run
1. Clone this repository
2. Run `flutter pub get`
3. Run `flutter run`

## Three Key Stepper Properties Demonstrated

### 1. `type` (StepperType)
- **Default**: `StepperType.vertical`
- **Purpose**: Controls whether steps are arranged vertically or horizontally
- **Demo**: Change line 31 from `StepperType.vertical` to `StepperType.horizontal` to see the layout difference

### 2. `currentStep` (int)
- **Default**: `0` (first step)
- **Purpose**: Determines which step is currently active/highlighted
- **Demo**: Tapping on step headers or using navigation buttons changes this value

### 3. `controlsBuilder` (Widget Function)
- **Default**: Standard "Continue" and "Cancel" buttons
- **Purpose**: Allows customization of navigation buttons with custom styling and behavior
- **Demo**: Custom blue "Next" button and "Back" text button with custom spacing

## Screenshot
![screenshot.png](https://github.com/user-attachments/assets/af552d5d-bc73-4c56-83c7-1660ee1af2d5)


## Real-World Use Case
This demo shows how Stepper widgets are commonly used in account registration flows, checkout processes, and multi-step forms where users need to complete information in a specific sequence.
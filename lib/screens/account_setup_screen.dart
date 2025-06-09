import 'package:flutter/material.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  _AccountSetupScreenState createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  int currentStep = 0;
  String username = '';
  String email = '';
  String password = '';
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Setup')),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: currentStep,
        // controlsBuilder: (context, details) {
        //   return Row(
        //     children: [
        //       if (details.stepIndex < 3)
        //         ElevatedButton(
        //           onPressed: details.onStepContinue,
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.blue,
        //             foregroundColor: Colors.white,
        //           ),
        //           child: const Text('Next'),
        //         ),
        //       const SizedBox(width: 8),
        //       if (details.stepIndex > 0)
        //         TextButton(
        //           onPressed: details.onStepCancel,
        //           child: const Text('Back'),
        //         ),
        //     ],
        //   );
        // },
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepContinue: () {
          if (currentStep < 3) {
            setState(() {
              currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          }
        },
        steps: [
          Step(
            title: const Text('Username'),
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter username',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => username = value,
                ),
                const SizedBox(height: 16),
              ],
            ),
            isActive: currentStep >= 0,
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('Email'),
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter email address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 16),
              ],
            ),
            isActive: currentStep >= 1,
            state: currentStep > 1
                ? StepState.complete
                : currentStep == 1
                ? StepState.indexed
                : StepState.disabled,
          ),
          Step(
            title: const Text('Password'),
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Create password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => password = value,
                ),
                const SizedBox(height: 16),
              ],
            ),
            isActive: currentStep >= 2,
            state: currentStep > 2
                ? StepState.complete
                : currentStep == 2
                ? StepState.indexed
                : StepState.disabled,
          ),
          Step(
            title: const Text('Confirmation'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Review your information:'),
                const SizedBox(height: 8),
                Text('Username: $username'),
                Text('Email: $email'),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text('I agree to the terms and conditions'),
                  value: agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreedToTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: agreedToTerms
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Account created successfully!'),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Create Account'),
                ),
              ],
            ),
            isActive: currentStep >= 3,
            state: currentStep == 3 ? StepState.indexed : StepState.disabled,
          ),
        ],
      ),
    );
  }
}

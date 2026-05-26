import 'package:flutter/material.dart';
import '/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Mero Guru",
                          style: TextStyle(
                            color: AppColors.orangeMain,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 24,
                            bottom: 40,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orangeMain,
                                ),
                              ),
                              const SizedBox(height: 24),
                              buildOutlineTextField(
                                "Username",
                                "Enter Username",
                              ),
                              const SizedBox(height: 16),
                              buildOutlineTextField("Email", "Enter Email"),
                              const SizedBox(height: 16),
                              buildOutlineTextField(
                                "Password",
                                "Enter Password",
                                isObscure: true,
                              ),
                              const SizedBox(height: 16),
                              buildOutlineTextField(
                                "Confirm Password",
                                "Enter Password",
                                isObscure: true,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (v) {}),
                                  const Expanded(
                                    child: Text(
                                      "I agree to the MeroGuru Terms and Conditions and Privacy Policy",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.maroonRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "REGISTER",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text.rich(
                                  TextSpan(
                                    text: "Already have an account? ",
                                    children: [
                                      TextSpan(
                                        text: "Sign in",
                                        style: TextStyle(
                                          color: AppColors.orangeMain,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
              ),
            );
          },
        ),
      ),
    );
  }
}

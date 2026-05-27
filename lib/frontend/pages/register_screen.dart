import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/top_nav_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomTopNavBar(
        title: "",
        showBack: true,
        style: NavBarStyle.TransAuth,
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
                      const Center(child: Text("Mero Guru", style: TextStyle(color: AppColors.orangeMain, fontSize: 32, fontWeight: FontWeight.bold))),
                      const SizedBox(height: 120),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 40),
                          decoration: const BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                          child: Column(
                            children: [
                              const Text("Register", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.orangeMain)),
                              const SizedBox(height: 24),
                              buildOutlineTextField("Username", "Enter Username"),
                              const SizedBox(height: 16),
                              buildOutlineTextField("Email", "Enter Email"),
                              const SizedBox(height: 16),
                              buildOutlineTextField("Password", "Enter Password", isObscure: true),
                              const SizedBox(height: 16),
                              buildOutlineTextField("Confirm Password", "Enter Password", isObscure: true),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Checkbox(value: false, activeColor: AppColors.orangeMain, onChanged: (v) {}),
                                  const Expanded(child: Text("I agree to the MeroGuru Terms and Conditions and Privacy Policy", style: TextStyle(fontSize: 12, color: AppColors.textDark))),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.maroonRed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                  onPressed: () {},
                                  child: const Text("REGISTER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Text.rich(
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(color: AppColors.textDark),
                                    children: [TextSpan(text: "Sign in", style: TextStyle(color: AppColors.orangeMain, fontWeight: FontWeight.bold))]
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
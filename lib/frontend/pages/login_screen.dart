import 'package:flutter/material.dart';
import '../../constants.dart';
import '../components/top_nav_bar.dart';
import 'register_screen.dart';
import '../../backend/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomTopNavBar(
        title: "",
        style: NavBarStyle.TransAuth,
        showBack: true,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(child: Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.orangeMain))),
                              const SizedBox(height: 32),
                              buildOutlineTextField("Email", "Enter Email"),
                              const SizedBox(height: 20),
                              buildOutlineTextField("Password", "Enter Password", isObscure: true),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(value: false, activeColor: AppColors.orangeMain, onChanged: (v) {}),
                                      const Text("Remember me", style: TextStyle(color: AppColors.textDark)),
                                    ],
                                  ),
                                  TextButton(onPressed: () {}, child: const Text("Forgot Password?", style: TextStyle(color: AppColors.orangeMain))),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.maroonRed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("LOGIN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                ),
                              ),
                              const Spacer(),
                              const SizedBox(height: 24),
                              Center(
                                child: GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                                  child: const Text.rich(
                                    TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(color: AppColors.textDark),
                                      children: [TextSpan(text: "Sign up", style: TextStyle(color: AppColors.orangeMain, fontWeight: FontWeight.bold))]
                                    )
                                  ),
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
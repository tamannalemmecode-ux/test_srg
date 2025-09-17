//hi
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool("isLoggedIn");
    if (loggedIn == true) {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> _login() async {
    final email = emailController.text.trim().toLowerCase();
    final password = passwordController.text.trim();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString("email");
    String? savedPassword = prefs.getString("password");

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please enter Email & Password",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (email == savedEmail && password == savedPassword) {
      if (rememberMe) {
        await prefs.setBool("isLoggedIn", true);
      }

      Get.snackbar("Success", "Logged in successfully 🎉",
          backgroundColor: Colors.green.shade100,
          snackPosition: SnackPosition.BOTTOM);

      Get.offAll(() =>  HomePage());
    } else {
      Get.snackbar("Error", "Invalid credentials ❌",
          backgroundColor: Colors.red.shade100,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.jpg", height: 100),
              const SizedBox(height: 20),
              const Text("Welcome Back",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text("Sign in to your account",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),

              // Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  hintText: "Enter your email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Password
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),

              // Remember Me + Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) =>
                            setState(() => rememberMe = value ?? false),
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordPage());
                    },
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Sign In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 24),

              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterPage());
                    },
                    child: const Text(
                      "Sign up now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

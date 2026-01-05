<<<<<<< HEAD
// lib/pages/splash_page.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_suvarnraj_group/routes/app_routes.dart';
=======
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_suvarnraj_group/routes/app_routes.dart';
import '../home_page.dart';
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
<<<<<<< HEAD
      Get.offNamed(AppRoutes.HOME_PAGE_ROUTE);
=======
      Get.offNamed(AppRoutes.HOME_PAGE_ROUTE); // ✅ Use GetX navigation
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background, // ✅ Theme-aware
=======
    return Scaffold(
      backgroundColor: Colors.white,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/Cleaning.json',
              width: 300,
              height: 300,
              repeat: true,
            ),
<<<<<<< HEAD
            const SizedBox(height: 80),
            Image.asset("assets/images/logo.jpg", height: 60),
            const SizedBox(height: 20),
            Text(
              "Welcome to Deep Cleaning Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary, // ✅ Theme-aware (was green)
=======
            const SizedBox(height: 80), // ✅ instead of Positioned
            Image.asset("assets/images/logo.jpg", height: 60),
            const SizedBox(height: 20),
            const Text(
              "Welcome to Cleaning Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38
              ),
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6e34eaa52e8c86220c49ced75b7dc111a935bc38

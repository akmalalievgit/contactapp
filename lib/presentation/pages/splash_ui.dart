import 'dart:async';
import 'package:contact_app/domain/repository/mypreference.dart';
import 'package:contact_app/presentation/pages/home_ui.dart';
import 'package:flutter/material.dart';

import 'login_ui.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({Key? key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
          () {
        if(MyPreference.getLogin()){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 230),
                Container(
                  width: 188,
                  height: 174,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/splashp_hoto.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 220,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const CircularProgressIndicator(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
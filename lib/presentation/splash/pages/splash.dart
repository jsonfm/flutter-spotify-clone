import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const GetStartedPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SvgPicture.asset(AppVectors.logo),
    ));
  }
}

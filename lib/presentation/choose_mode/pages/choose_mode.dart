import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin_or_signup.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppImages.chooseModeBG),
              fit: BoxFit.contain,
            )),
            child: const SafeArea(
              child: Content(),
            ),
          )
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(AppVectors.logo),
        ),
        const Spacer(),
        const Text('Choose Mode',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeButton(
              icon: AppVectors.moon,
              label: 'Dark Mode',
              onTap: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              },
            ),
            SizedBox(
              width: 30,
            ),
            ThemeButton(
              icon: AppVectors.sun,
              label: 'Light Mode',
              onTap: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.light);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        BasicAppButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SigninOrSignup()));
          },
          title: 'Get Started',
          height: 60,
        )
      ],
    );
  }
}

class ThemeButton extends StatelessWidget {
  final String icon;
  final String label;
  final GestureTapCallback? onTap;

  const ThemeButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(icon, fit: BoxFit.none),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(label, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}

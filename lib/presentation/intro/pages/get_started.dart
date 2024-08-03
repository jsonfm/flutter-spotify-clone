import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                fit: BoxFit.contain, image: AssetImage(AppImages.introBG)),
          ),
          child: const SafeArea(
            child: Content(),
          ),
        ),
      ],
    ));
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
          child: SvgPicture.asset(AppVectors.logo),
          alignment: Alignment.topCenter,
        ),
        const Spacer(),
        const Text('Enjoy Listening To Music',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: 21,
        ),
        const Text(
            'Excepteur aliquip nisi magna consectetur cillum eu est quis occaecat proident. Cillum eu est quis occaecat proident. cillum eu est quis.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.grey)),
        const SizedBox(
          height: 20,
        ),
        BasicAppButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChooseMode()));
          },
          title: 'Get Started',
          height: 60,
        )
      ],
    );
  }
}

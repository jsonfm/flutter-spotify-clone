import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AppVectors.topPattern)),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AppVectors.bottomPattern)),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.authBG)),
          const Content()
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
    return SafeArea(
      child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(
                  height: 40,
                ),
                const Text('Enjoy listening to music',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Irure elit commodo elit exercitation nostrud elit. Mollit eu magna proident in minim quis voluptate consequat irure veniam.',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/logo_widget.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:hack_talk/features/home/presentation/screen/Audio/audio_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/computer_vision/computer_vision_screen.dart';
import 'package:hack_talk/features/home/presentation/screen/vr/ve_screen.dart';
import 'package:hack_talk/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:hack_talk/features/home/presentation/widgets/home_button_widget.dart';
import 'package:hack_talk/features/rating/presentation/screens/rating/rating_screen.dart';

import 'alertWidget.dart';

final GlobalKey<ScaffoldState> globalKey = GlobalKey();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBarWidget(
        onPressed: () {
          globalKey.currentState?.openDrawer();
        },
        icon: Icons.menu,
        actions: const [
          LogoWidget(
            isBigger: false,
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.drawerColor,
        width: MediaQuery.of(context).size.width * 0.6,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 44),
                child: Row(
                  children: [
                    SvgPicture.asset('profile'.getSvgAsset),
                    const SizedBox(
                      width: 8,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget('Rana Hamdy'),
                        TextWidget('ranahamdy269@gmail.com', fontSize: 7),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          AppRoutes.routeTo(context, const RatingScreen());
                        });
                      },
                      icon: const Icon(Icons.settings)),
                  const TextWidget('Setting'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.login,
                          color: AppColors.textButtonBlueColor)),
                  const TextWidget('Logout',
                      color: AppColors.textButtonBlueColor),
                ],
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('home'.getSvgAsset),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Row(
                children: [
                  SvgPicture.asset('ellipse'.getSvgAsset),
                  const SizedBox(width: 8),
                  const TextWidget('Choose the option that suits you best'),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Computer Vision',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(
                            context, const ComputerVisionScreen());
                      });
                    },
                    textColor: AppColors.textButtonBlueColor,
                    image: '',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SmallHomeButtonWidget('question', onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialogWidget(
                      text:
                          'Computer version role is to take your movement while presenting, analyze it and return your movement mistakes so that you can work on them and improve your  performance skills ',
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Speech',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(context, const AudioScreen());
                      });
                    },
                    textColor: AppColors.textButtonBlueColor,
                    image: '',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SmallHomeButtonWidget('question', onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialogWidget(
                        text:
                            'speech role is to take your voice ,analyse it and give you notice about your performance so you can work on your mistakes to get your perfect result '),
                  );
                }),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: HomeButtonWidget(
                    color: AppColors.homeButtonColor,
                    text: 'Virtual reality',
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        AppRoutes.routeTo(context, const VrScreen());
                      });
                    },
                    textColor: AppColors.textButtonBlueColor,
                    image: '',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SmallHomeButtonWidget('question', onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialogWidget(
                        text:
                            'virtual reality role is to overcome your fear of public speaking  by placing you in an almost real environment so you can practice and get notices about your performance so you can work to improve it  '),
                  );
                }),
              ],
            ),

            const SizedBox(
              height: 44,
            ),
            // ButtonWidget(
            //   'Try',
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

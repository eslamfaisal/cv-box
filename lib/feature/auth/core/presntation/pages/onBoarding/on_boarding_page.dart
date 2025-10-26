import 'package:cv_box/presentation/constants/images_string.dart';
import 'package:cv_box/presentation/constants/text_string.dart';
import 'package:cv_box/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../presentation/constants/color.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //page view
            PageView(
              controller: _pageController,
              children: [
              const  onBoarding_widget(
                  title: CText.onBoardingTitle1,
                  subTitle: CText.onBoardingSubTitle1,
                  imagePath: CImages.onBoardingImage1,
                ),
                const  onBoarding_widget(
                  title: CText.onBoardingTitle2,
                  subTitle: CText.onBoardingSubTitle2,
                  imagePath: CImages.onBoardingImage2,
                ),
                const  onBoarding_widget(
                  title: CText.onBoardingTitle3,
                  subTitle: CText.onBoardingSubTitle3,
                  imagePath: CImages.onBoardingImage3,
                ),
              ],
            ),

            //skip button
            const OnBoardingSkip(),

            //dot indicator
            pageIndicator_widget(pageController: _pageController),

            //next button
            OnBoardingNextButton(controller: _pageController),
          ],

        ),
      ),
    );
  }
}
class OnBoardingNextButton extends StatelessWidget {
  final PageController controller;

  const OnBoardingNextButton({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: HelperFunction.getHeight(context) * 0.04,
      right: HelperFunction.getWidth(context) * 0.1,

      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          final bool isLastPage = controller.hasClients && controller.page == 2;

          final String buttonText = isLastPage ? "Get Started" : "Next";

          void onPressedAction() {
            if (isLastPage) {
              // navigate to login page
            } else {
              controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
              );
            }
          }

          return ElevatedButton(
            onPressed: onPressedAction,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(HelperFunction.getWidth(context) * 0.035),
              backgroundColor: CColor.primaryColor,
            ),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

class pageIndicator_widget extends StatelessWidget {
  const pageIndicator_widget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: HelperFunction.getHeight(context) * 0.06,
      left: HelperFunction.getWidth(context) * 0.1,
      child: SmoothPageIndicator(
        count: 3,
        effect: const ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: CColor.primaryColor,
        ), controller: _pageController,
      ),
    );
  }
}


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: HelperFunction.getHeight(context) * 0.01,
      right: HelperFunction.getWidth(context) * 0.03,

      child: TextButton(

        onPressed: () {
          //navigate to home page
        },
        child: Text( "skip",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: CColor.primaryColor,
          ),
        ),
      ),
    );
  }
}

class onBoarding_widget extends StatelessWidget {
  final String title, subTitle, imagePath;

  const onBoarding_widget({
    required this.title,
    required this.subTitle,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image(
            width: HelperFunction.getWidth(context) * 0.8,
            image: AssetImage(imagePath),
            height: HelperFunction.getHeight(context) * 0.6,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox( height: HelperFunction.getHeight(context) * 0.04),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_arabic_mina_course/domain%20layers/model/models.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/onboarding_screen/viewmodel/onboarding_viewmodel.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/assets_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/color_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/constants_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/routes_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/strings_manager.dart';
import 'package:advanced_arabic_mina_course/presentation%20layers/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  // this function is mearge between viewModel and view (onboarding_viewmodel.dart, onboardign_view.dart)
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSliderViewObject,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  // this is scaffold or data will be returned in page
  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness
                .dark, // this is mean is the wifi icon and any icon show in your phone is will be a dark icon
          ),
        ),
        body: PageView.builder(
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (value) {
            _viewModel.onPageChanged(value);
          },
          itemBuilder: (context, int index) {
            return OnBoardingPage(sliderViewObject.sliderobject);
          },
          controller: _pageController,
        ),
        bottomSheet: Container(
          width: double.infinity,
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // this is for skip button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.loginRoute);
                  },
                ),
              ),
              // this is for indicator
              _getWidgetIndicator(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getWidgetIndicator(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssetsManager.leftArrowIc,
                ),
              ),
              // go to previous slide
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goPrevious(),
                  duration:
                      const Duration(milliseconds: AppConstants.dutrationTime),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          ),
          //indcator
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getCircleIndcator(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          // right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssetsManager.rightArrowIc,
                ),
              ),
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goNext(),
                  duration:
                      const Duration(milliseconds: AppConstants.dutrationTime),
                  curve: Curves.bounceInOut,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircleIndcator(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssetsManager.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssetsManager.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

// this class will Receive one SliderObject only and show this sliderObject in the Column
class OnBoardingPage extends StatelessWidget {
  // this final variable use when you changed from screen to another screen in the list created in _OnboardingViewState and named _list all of this created for slider for screen to another screen
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        // title in any boarding page
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        // subTitle in any boarding page
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        // images in any boarding page
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

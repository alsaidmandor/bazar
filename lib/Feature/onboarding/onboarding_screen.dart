import 'package:bazaar/core/theme/styles.dart';
import 'package:bazaar/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/helper/spacing.dart';
import '../../core/theme/colors.dart';
import '../../core/widgets/svg_image.dart';

class BoardModel {
  final String image;
  final String title;
  final String body;

  BoardModel({required this.image, required this.title, required this.body});
}

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<BoardModel>? list;

  void submit() {
    // navigateAndFinish(
    //   widget: LoginScreen(),
    //   context: context,
    // );
  }

  @override
  void initState() {
    super.initState();

    list = [
      BoardModel(
          image: 'assets/icons/onboarding_1.svg',
          title: 'Now reading books will be easier',
          body:
              ' Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.'),
      BoardModel(
        image: 'assets/icons/onboarding_2.svg',
        title: 'Your Bookish Soulmate Awaits',
        body:
            'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
      ),
      BoardModel(
        image: 'assets/icons/onboarding_2.svg',
        title: 'Start Your Adventure',
        body:
            'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
      ),
    ];
  }

  var isLast = false;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: AppTextButton(
                  buttonText: 'skip',
                  textStyle: TextStyles.fontBody14BlackMedium
                      .copyWith(color: AppColor.primary500),
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  buttonWidth: 50,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (i) {
                  if (i == (list!.length - 1) && !isLast) {
                    setState(() => isLast = true);
                  } else if (isLast) {
                    setState(() => isLast = false);
                  }
                },
                controller: controller,
                itemCount: list!.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SvgImage(
                          assetPath: list![i].image,
                        ),
                      ),
                      // const SizedBox(height: 15.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 20.0, end: 20.0),
                              child: Center(
                                child: Container(
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        list![i].title,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyles
                                                .fontHeading24BlackBold),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        list![i].body,
                                        textAlign: TextAlign.center,

                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyles
                                                .fontBody16BlackRegular
                                                .copyWith(
                                                    color:
                                                        AppColor.greyScale500),

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            /*
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTextButton(
                                  buttonText: 'Continue',
                                  textStyle: TextStyles.fontHeading16BlackBold,

                                  onPressed: () {
                                    if (isLast) {
                                      submit();
                                    } else {
                                      controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 750),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                      );
                                    }
                                  },
                                ),
                              ],
                            )
        */
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: list!.length,
                      effect: const ScrollingDotsEffect(
                        activeDotColor: AppColor.primary500,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    verticalSpace(15),
                    AppTextButton(
                      buttonText: 'Continue',
                      textStyle: TextStyles.fontHeading16BlackBold.copyWith(color: AppColor.white),
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                    ),
                    verticalSpace(15),
                    AppTextButton(
                        buttonText: 'Sign In',
                        textStyle: TextStyles.fontHeading16BlackBold.copyWith(color: AppColor.primary500),
                        onPressed: () {},
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

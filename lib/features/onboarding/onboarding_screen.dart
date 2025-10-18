import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/features/onboarding/widgets/onboarding_page.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
            child: Text(
              'Passer',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        leadingWidth: 95,
      ),
      body: Column(
        children: [
          // Progess Indicator
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSizes.p20),
            child: Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: index == 3 - 1 ? 0 : 8),
                    decoration: BoxDecoration(
                      color: index <= _currentPage
                          ? AppColors.primary
                          : AppColors.dividerLight,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                OnboardingPage(
                  index: _currentPage,
                  imagePath: 'assets/images/onboarding/onboarding_1.jpg',
                  title: 'Luxury stars\nJust one click away',
                  subTitle: 'Book now and Experience luxury like never before',
                ),
                OnboardingPage(
                  index: _currentPage,
                  imagePath: 'assets/images/onboarding/onboarding_2.jpg',
                  title: 'Luxury stars \n Just one click away',
                  subTitle:
                      'Book now and Experience luxury \n like never before',
                ),
                OnboardingPage(
                  index: _currentPage,
                  imagePath: 'assets/images/onboarding/onboarding_3.jpg',
                  title: 'Luxury stars \n Just one click away',
                  subTitle:
                      'Book now and Experience luxury \n like never before',
                ),
              ],
            ),
          ),

          //Bottom section
          Container(
            padding: EdgeInsets.all(AppSizes.p20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 3 - 1) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.goNamed(AppRoute.home.name);
                      }
                    },
                    child: Text(
                      _currentPage == 3 - 1 ? 'Commencer' : 'Suivant',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: AppColors.backgroundLight),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.p24),
        ],
      ),
    );
  }
}

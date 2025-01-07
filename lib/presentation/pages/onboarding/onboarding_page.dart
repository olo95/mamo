import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: FilledButton(
                  onPressed: () {},
                  child: Text('End onboarding'),
                ),
              ),
              PageView(
                children: [
                  SvgPicture.network('https://www.svgrepo.com/show/530164/password-management.svg'),
                  SvgPicture.network('https://www.svgrepo.com/show/530162/credit-report.svg'),
                  SvgPicture.network('https://www.svgrepo.com/show/530176/deposit.svg'),
                ],
              ),
            ],
          ),
        ),
      );
}

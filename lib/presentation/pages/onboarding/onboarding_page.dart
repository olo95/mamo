import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamo/presentation/routing/routes.dart';
import 'package:mamo/presentation/widgets/mamo_loader.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                children: [
                  SvgPicture.network(
                    'https://www.svgrepo.com/show/530164/password-management.svg',
                    placeholderBuilder: (BuildContext context) => _ImageLoading(),
                  ),
                  SvgPicture.network(
                    'https://www.svgrepo.com/show/530162/credit-report.svg',
                    placeholderBuilder: (BuildContext context) => _ImageLoading(),
                  ),
                  SvgPicture.network(
                    'https://www.svgrepo.com/show/530176/deposit.svg',
                    placeholderBuilder: (BuildContext context) => _ImageLoading(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FilledButton(
                  onPressed: () {
                    DashboardRoute().go(context);
                  },
                  child: Text('End onboarding'),
                ),
              ),
            ],
          ),
        ),
      );
}

class _ImageLoading extends StatelessWidget {
  const _ImageLoading();

  @override
  Widget build(BuildContext context) => const MamoLoader();
}

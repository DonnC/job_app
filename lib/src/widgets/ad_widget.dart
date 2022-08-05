

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/job_category_ads.dart';
import '../utils/app_colors.dart';
import 'clip_wave.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({
    Key? key,
    this.index = 0,
    required this.jobAd,
  }) : super(key: key);
  final int index;
  final JobCategoryAd jobAd;

  Widget _widgetShowTitle(BuildContext context, {double? top, double? bottom}) {
    String sp = ' ' * index;

    return Positioned(
      bottom: bottom,
      top: top,
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$sp ${index + 1} ',
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 78),
          children: [
            const TextSpan(text: '.  '),
            TextSpan(
              text: jobAd.title,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 17,
                    color: AppColors.numberTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetShowImage({double? top, double? bottom}) {
    return Positioned(
      right: kIsWeb ? 300 : 3,
      top: top,
      bottom: bottom,
      child: SvgPicture.asset(jobAd.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: index.isOdd ? PostWaveClipper() : null,
      child: Container(
        height: 260,
        decoration: BoxDecoration(
            color: index.isOdd ? AppColors.unselectedTabTextColor : null),
        child: Stack(
          children: index == 0
              ? [
                  _widgetShowTitle(context, bottom: 50),
                  _widgetShowImage(top: 20),
                ]
              : [
                  _widgetShowTitle(context, top: 2),
                  _widgetShowImage(bottom: 2),
                ],
        ),
      ),
    );
  }
}

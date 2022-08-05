import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../constants/mock_data.dart';
import '../utils/app_colors.dart';
import '../widgets/ad_widget.dart';
import '../widgets/clip_wave.dart';
import '../widgets/custom_button.dart';
import '../widgets/header_img.dart';
import '../widgets/header_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late ScrollController _scrollController;
  final double borderRadius = 15.0;

  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _showMoreWebBtnOptions {
    return _scrollController.hasClients && _scrollController.offset > 300;
  }

  Widget buildListRow(WordPair pair) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 20,
            width: 20,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          pair.asCamelCase,
          style: const TextStyle(fontSize: 22.0),
        ),
      ],
    );
  }

  List<Widget> buildWebOptions() {
    return kIsWeb && _showMoreWebBtnOptions
        ? [
            Text(
              'Jetzt Klicken',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.numberTextColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: CustomButton(
                height: 30,
                radius: 10,
                fontSize: 12,
                buttonText: 'Kostenlos Registrieren',
                enableGradient: false,
              ),
            ),
          ]
        : const [];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.toggleButtonSelectedColor,
          title: Row(
            children: [
              const Spacer(),
              ...buildWebOptions(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.selectedTabTextColor),
                  ),
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: size.height * 0.9,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.cardBackgroundColor,
                        AppColors.unselectedTabTextColor
                      ],
                    ),
                  ),
                  child: kIsWeb
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: (size.height * 0.9) * 0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  HeaderWidget(),
                                  SizedBox(height: 20),
                                  CustomButton(
                                      radius: 10,
                                      height: 30,
                                      buttonText: 'Kostenlos Registrieren'),
                                ],
                              ),
                              const SizedBox(width: 120),
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                                child: const HeaderImage(width: 280),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: const [
                            HeaderWidget(),
                            HeaderImage(width: 300),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 40),
              ToggleSwitch(
                totalSwitches: 3,
                initialLabelIndex: selectedTabIndex,
                minWidth: kIsWeb ? 150 : double.infinity,
                cornerRadius: borderRadius,
                activeBgColor: const [AppColors.toggleButtonSelectedColor],
                inactiveBgColor: AppColors.backgroundColor,
                borderColor: const [AppColors.buttonBorderColor],
                borderWidth: 1,
                dividerColor: AppColors.buttonBorderColor,
                inactiveFgColor: AppColors.selectedTabTextColor,
                labels: mockAdsCategories.map((e) => e.category).toList(),
                onToggle: (index) {
                  setState(() {
                    selectedTabIndex = index ?? 0;
                  });
                },
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  mockAdsCategories
                      .firstWhere((element) =>
                          element.category ==
                          mockAdsCategories[selectedTabIndex].category)
                      .header,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final jobAd = mockAdsCategories
                        .firstWhere((element) =>
                            element.category ==
                            mockAdsCategories[selectedTabIndex].category)
                        .ads[index];

                    return AdWidget(index: index, jobAd: jobAd);
                  },
                  itemCount: mockAdsCategories
                      .firstWhere((element) =>
                          element.category ==
                          mockAdsCategories[selectedTabIndex].category)
                      .ads
                      .length),
            ],
          ),
        ),
        bottomNavigationBar: kIsWeb
            ? null
            : Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: CustomButton(
                        radius: 10, buttonText: 'Kostenlos Registrieren'),
                  ),
                ),
              ),
      ),
    );
  }
}

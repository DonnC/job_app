import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/agreement.svg',
        width: width - 30,
      ),
    );
  }
}

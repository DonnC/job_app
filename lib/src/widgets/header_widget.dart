import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        'Deine Job\nwebsite',
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
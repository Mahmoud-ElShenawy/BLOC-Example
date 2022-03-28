import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;

  const TextWidget({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
    );
  }
}

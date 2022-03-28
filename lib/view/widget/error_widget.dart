import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? message;
  final Function()? onTap;

   const ErrorTextWidget({Key? key, this.message, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onTap!,
          child: Text(
            message!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

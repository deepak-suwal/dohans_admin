import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class AppButton extends StatelessWidget {
  final Future<void> Function()? onPressed;
  final String buttonText;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
        onTap: onPressed,
        builder: (context, Future<void> Function()? onTap) {
          return ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(MediaQuery.of(context).size.width, 48)),
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        });
  }
}

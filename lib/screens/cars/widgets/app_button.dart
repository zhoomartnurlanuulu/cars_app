import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.onPressed, required this.isFullFilled , required this.isLoading}) : super(key: key);
  final Function() onPressed;
  final bool isFullFilled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: isLoading
            ? null
            : isFullFilled
                ? onPressed
                : null,
        child: isLoading
            ? const SizedBox(
                height: 15,
                child: CircularProgressIndicator(),
              )
            : const Text('Добавить'));
  }
}

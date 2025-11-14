import 'package:flutter/material.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
  });

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.p48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? Container(
                height: AppSizes.p20,
                width: AppSizes.p20,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const CircularProgressIndicator(),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

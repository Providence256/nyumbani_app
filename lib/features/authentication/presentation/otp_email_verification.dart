import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';

class OtpEmailVerification extends StatelessWidget {
  const OtpEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.p20,
          children: [
            Text(
              'Verifier votre adresse E-mail',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text.rich(
              style: Theme.of(context).textTheme.labelLarge,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Un code de vérification vous a été envoyé à ',
                  ),
                  TextSpan(
                    text: 'davidmusaghi7@gmail.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(text: '. Veuillez entrer ce code pour continuer.'),
                ],
              ),
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
              filled: true,
              showFieldAsBox: true,
              fieldWidth: AppSizes.p48,
              focusedBorderColor: AppColors.primary.withValues(alpha: 0.9),
              enabledBorderColor: AppColors.textSecondaryLight.withValues(
                alpha: 0.5,
              ),
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: AppSizes.p20,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Verifier email',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

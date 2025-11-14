import 'package:flutter/material.dart';
import 'package:nyumbani_app/common/custom_divider.dart';
import 'package:nyumbani_app/features/authentication/presentation/email_login_screen.dart';
import 'package:nyumbani_app/utils/constants/app_colors.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, this.onSignedIn});

  final VoidCallback? onSignedIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nyumbani',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Column(
          spacing: AppSizes.p16,
          children: [
            Text(
              'Connectez-vous pour retrouver vos voyages et favoris en un seul endroit',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: AppSizes.p10),
            EmailLoginScreen(onSignedIn: onSignedIn),
            SizedBox(height: AppSizes.p10),
            Row(
              spacing: AppSizes.p12,
              children: [
                Expanded(child: CustomDivider()),
                Text('Où', style: Theme.of(context).textTheme.labelLarge),
                Expanded(child: CustomDivider()),
              ],
            ),
            SizedBox(height: AppSizes.p10),
            ConnectWithButton(
              icon: PhosphorIcons.googleLogo(),
              text: 'Continuer avec Google',
              iconColor: Colors.red,
              onPressed: () {},
            ),
            ConnectWithButton(
              icon: PhosphorIcons.appleLogo(),
              text: 'Continuer avec Apple',
              iconColor: Theme.of(context).colorScheme.onSurface,
              onPressed: () {},
            ),

            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontSize: AppSizes.p12),
                children: [
                  TextSpan(
                    text:
                        'En vous connectant ou en créant un compte, vous acceptez nos ',
                  ),
                  TextSpan(
                    text: 'Conditions générales d\'utilisation ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(text: 'et '),
                  TextSpan(
                    text: 'Politique de confidentialité.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.p12),
          ],
        ),
      ),
    );
  }
}

class ConnectWithButton extends StatelessWidget {
  const ConnectWithButton({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.onPressed,
  });
  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.p8),
            side: BorderSide(color: AppColors.textSecondaryLight),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizes.p10,
          children: [
            Icon(icon, color: iconColor, size: AppSizes.p24),
            Text(text, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}

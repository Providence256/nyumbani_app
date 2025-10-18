import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:nyumbani_app/utils/themes/theme_notifier.dart';

class DevicePreferenceScreen extends ConsumerWidget {
  const DevicePreferenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Préférences',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Theme',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
                icon: Icon(
                  theme.brightness == Brightness.dark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Notifications',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontSize: 16),
              ),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}

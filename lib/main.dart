import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nyumbani_app/features/wishlists/data/local/local_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/data/local/sembast_wishlist_repository.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/services/preferences_service.dart';
import 'package:nyumbani_app/utils/themes/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesService.init();
  await initializeDateFormatting('fr_FR', null);

  final localWishListRepository = await SembastWishlistRepository.makeDefault();

  runApp(
    ProviderScope(
      overrides: [
        localWishlistRepositoryProvider.overrideWithValue(
          localWishListRepository,
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nyumbani',
      theme: theme,
      themeMode: ThemeMode.system,
      routerConfig: goRouter,
    );
  }
}

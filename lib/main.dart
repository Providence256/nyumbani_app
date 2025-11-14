import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nyumbani_app/features/wishlists/data/local/local_wishlist_repository.dart';
import 'package:nyumbani_app/features/wishlists/data/local/sembast_wishlist_repository.dart';
import 'package:nyumbani_app/firebase_options.dart';
import 'package:nyumbani_app/routing/app_router.dart';
import 'package:nyumbani_app/services/preferences_service.dart';
import 'package:nyumbani_app/utils/themes/theme_notifier.dart';
import 'package:toastification/toastification.dart';

Future<void> setupEmulators() async {
  await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator(' 127.0.0.1', 8080);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupEmulators();

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
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Nyumbani',
        theme: theme,
        themeMode: ThemeMode.system,
        routerConfig: goRouter,
      ),
    );
  }
}

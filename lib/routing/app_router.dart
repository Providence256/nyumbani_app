import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyumbani_app/application_screen.dart';
import 'package:nyumbani_app/features/authentication/data/auth_repository.dart';
import 'package:nyumbani_app/features/authentication/presentation/auth_screen.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_overview_screen.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_review_screen.dart';
import 'package:nyumbani_app/features/home/home_screen.dart';
import 'package:nyumbani_app/features/listing/presentation/listing_amenity_screen.dart';
import 'package:nyumbani_app/features/listing/presentation/listing_screen.dart';
import 'package:nyumbani_app/features/message/presentation/message_chat_screen.dart';
import 'package:nyumbani_app/features/message/presentation/message_screen.dart';
import 'package:nyumbani_app/features/onboarding/onboarding_screen.dart';
import 'package:nyumbani_app/features/profile/presentation/device_preference_screen.dart';
import 'package:nyumbani_app/features/profile/presentation/personnal_info_screen.dart';
import 'package:nyumbani_app/features/profile/presentation/profile_screen.dart';
import 'package:nyumbani_app/features/trips/presentation/trips_screen.dart';
import 'package:nyumbani_app/features/wishlists/presentation/wishlists_screen.dart';

enum AppRoute {
  onboarding,
  application,
  home,
  favoris,
  reservations,
  messages,
  chatMessage,
  profile,
  personnalInfo,
  devicePreference,
  listing,
  bookingReview,
  bokingOverView,
  listAmenity,
  authentication,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'homeNavigator',
);
final _profileNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'profileNavigator',
);
final _messageNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'messageNavigator',
);

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;
      final path = state.uri.path;

      if (isLoggedIn) {
        if (path == '/auth') {
          return '/home';
        }
      } else {
        if (path == '/profile') {
          return '/auth';
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.onboarding.name,
        builder: (context, state) => OnboardingScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ApplicationScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: '/listing/:id',
                    name: AppRoute.listing.name,
                    builder: (context, state) {
                      final listingId = state.pathParameters['id']!;
                      return ListingScreen(listingId: listingId);
                    },
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: '/booking-review',
                        name: AppRoute.bookingReview.name,
                        pageBuilder: (context, state) {
                          final listingId = state.pathParameters['id']!;
                          return MaterialPage(
                            fullscreenDialog: true,

                            child: BookingReviewScreen(listingId: listingId),
                          );
                        },
                        routes: [
                          GoRoute(
                            parentNavigatorKey: _rootNavigatorKey,
                            path: '/booking_overview',
                            name: AppRoute.bokingOverView.name,
                            builder: (context, state) {
                              final listingId = state.pathParameters['id']!;
                              return BookingOverviewScreen(
                                listingId: listingId,
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: '/list-aminities',
                        name: AppRoute.listAmenity.name,
                        builder: (context, state) {
                          final listingId = state.pathParameters['id']!;
                          return ListingAmenityScreen(listingId: listingId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favoris',
                name: AppRoute.favoris.name,
                builder: (context, state) => WishlistsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/reservations',
                name: AppRoute.reservations.name,
                builder: (context, state) => TripsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _messageNavigatorKey,
            routes: [
              GoRoute(
                path: '/messages',
                name: AppRoute.messages.name,
                builder: (context, state) => MessageScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: '/chat-message',
                    name: AppRoute.chatMessage.name,
                    builder: (context, state) => MessageChatScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                builder: (context, state) => ProfileScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: '/personnal-info',
                    name: AppRoute.personnalInfo.name,
                    builder: (context, state) => PersonnalInfoScreen(),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: '/device-preference',
                    name: AppRoute.devicePreference.name,
                    pageBuilder: (context, state) => MaterialPage(
                      fullscreenDialog: true,
                      child: DevicePreferenceScreen(),
                    ),
                  ),
                ],
              ),
              GoRoute(
                path: '/auth',
                name: AppRoute.authentication.name,
                builder: (context, state) => AuthScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

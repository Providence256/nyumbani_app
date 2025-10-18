import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )
                : TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          indicatorColor: Theme.of(
            context,
          ).colorScheme.primary.withValues(alpha: 0.2),
          destinations: [
            NavigationDestination(
              icon: Icon(
                PhosphorIcons.houseLine(),
                color: Theme.of(context).colorScheme.onSurface,
              ),
              selectedIcon: Icon(
                PhosphorIcons.houseLine(),
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Explorer',
            ),
            NavigationDestination(
              icon: Icon(PhosphorIcons.heart()),
              selectedIcon: Icon(
                PhosphorIcons.heart(),
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Favoris',
            ),
            NavigationDestination(
              icon: Icon(PhosphorIcons.calendar()),
              selectedIcon: Icon(
                PhosphorIcons.calendar(),
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Bookings',
            ),
            NavigationDestination(
              icon: Icon(PhosphorIcons.chatCircleText()),
              selectedIcon: Icon(
                PhosphorIcons.chatCircleText(),
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Messages',
            ),
            NavigationDestination(
              icon: Icon(PhosphorIcons.user()),
              selectedIcon: Icon(
                PhosphorIcons.user(),
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}

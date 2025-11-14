import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/authentication/data/auth_repository.dart';
import 'package:nyumbani_app/features/authentication/presentation/auth_screen.dart';
import 'package:nyumbani_app/features/booking/presentation/booking_overview_screen.dart';

enum CheckoutSubRoute { register, bookingOverview }

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({required this.listingId, super.key});

  final String listingId;

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  late final PageController _controller;

  var _subRoute = CheckoutSubRoute.register;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authRepositoryProvider).currentUser;

    if (user != null) {
      setState(() => _subRoute = CheckoutSubRoute.bookingOverview);
    }

    _controller = PageController(initialPage: _subRoute.index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSignedId() {
    setState(() => _subRoute = CheckoutSubRoute.bookingOverview);

    _controller.animateToPage(
      _subRoute.index,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          AuthScreen(onSignedIn: _onSignedId),
          BookingOverviewScreen(listingId: widget.listingId),
        ],
      ),
    );
  }
}

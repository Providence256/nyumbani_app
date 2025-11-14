import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingController extends StateNotifier<AsyncValue<void>> {
  BookingController() : super(AsyncValue.data(null));
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/models/guest_info.dart';

class SelectGuestNotifier extends StateNotifier<GuestInfo> {
  SelectGuestNotifier() : super(GuestInfo());
}

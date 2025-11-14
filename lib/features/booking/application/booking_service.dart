import 'package:nyumbani_app/features/authentication/data/auth_repository.dart';
import 'package:nyumbani_app/features/booking/data/booking_repository.dart';

class BookingService {
  BookingService({
    required this.authRepository,
    required this.bookingRepository,
    required this.currentDateBuilder,
  });

  final AuthRepository authRepository;
  final BookingRepository bookingRepository;
  final DateTime Function() currentDateBuilder;

  Future<void> placeBooking() async {
    final uid = authRepository.currentUser!.uid;
  }
}

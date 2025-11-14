import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/authentication/data/auth_repository.dart';

class EmailLoginController extends StateNotifier<AsyncValue<void>> {
  EmailLoginController({required this.authRepository})
    : super(AsyncValue<void>.data(null));

  final AuthRepository authRepository;

  Future<bool> submit(String email, String password) async {
    state = AsyncValue.loading();
    final value = await AsyncValue.guard(
      () => authRepository.signInOrCreateUser(email, password),
    );

    state = value;

    return state.hasError == false;
  }

  Future<void> signOut() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final emailLoginControllerProvider =
    StateNotifierProvider<EmailLoginController, AsyncValue<void>>((ref) {
      final authRepository = ref.read(authRepositoryProvider);
      return EmailLoginController(authRepository: authRepository);
    });

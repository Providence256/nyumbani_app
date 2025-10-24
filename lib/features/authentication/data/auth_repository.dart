import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/features/authentication/domain/app_user.dart';
import 'package:nyumbani_app/utils/in_memory_store.dart';

class AuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

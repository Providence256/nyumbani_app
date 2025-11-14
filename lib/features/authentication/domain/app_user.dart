// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  AppUser({required this.uid, required this.email});

  final String uid;
  final String? email;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email)';

  AppUser copyWith({String? uid, String? email}) {
    return AppUser(uid: uid ?? this.uid, email: email ?? this.email);
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}

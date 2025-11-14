import 'package:nyumbani_app/helpers/string_validators.dart';

mixin EmailPasswordValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordLengthSubmitValidator =
      MinLengthStringValidator(8);
  final StringValidator passwordSigInSubmitValidator =
      NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordLengthSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
        ? 'Email est obligatoire'
        : 'Email est invalide';

    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    bool showErrorText = !canSubmitPassword(password);
    String errorText = password.isEmpty
        ? 'Mot de passe est obligatoire'
        : 'Mot de passe trop court';

    return showErrorText ? errorText : null;
  }
}

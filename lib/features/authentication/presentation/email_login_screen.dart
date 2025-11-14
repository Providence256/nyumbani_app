import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyumbani_app/common/primary_button.dart';
import 'package:nyumbani_app/features/authentication/presentation/email_login_controller.dart';
import 'package:nyumbani_app/features/authentication/presentation/email_password_validators.dart';
import 'package:nyumbani_app/helpers/string_validators.dart';
import 'package:nyumbani_app/utils/async_value_ui.dart';
import 'package:nyumbani_app/utils/constants/app_sizes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmailLoginScreen extends ConsumerStatefulWidget {
  const EmailLoginScreen({super.key, this.onSignedIn});

  final VoidCallback? onSignedIn;

  @override
  ConsumerState<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends ConsumerState<EmailLoginScreen>
    with EmailPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _submitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);

    if (_formKey.currentState!.validate()) {
      final controller = ref.read(emailLoginControllerProvider.notifier);
      final success = await controller.submit(email, password);

      if (success) {
        widget.onSignedIn?.call();
      }
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (canSubmitPassword(password)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      emailLoginControllerProvider,
      (_, state) => state.showToastNotificationError(),
    );

    final state = ref.watch(emailLoginControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.p20,
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'adresse e-mail',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Entrer votre e-mail',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                style: TextStyle(fontWeight: FontWeight.normal),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    !_submitted ? null : emailErrorText(email ?? ''),
                autocorrect: false,
                onEditingComplete: () => _emailEditingComplete(),
                inputFormatters: [
                  ValidatorInputFormatter(
                    editingValidator: EmailEditingRegexValidator(),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.p10),
              Text(
                'Mot de passe',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Entrer votre mot de passe',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: Icon(PhosphorIcons.eyeSlash()),
                ),
                style: TextStyle(fontWeight: FontWeight.normal),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) =>
                    !_submitted ? null : passwordErrorText(password ?? ''),
                onEditingComplete: () => _passwordEditingComplete(),
                autocorrect: false,
              ),
            ],
          ),
        ),
        PrimaryButton(
          isLoading: state.isLoading,
          text: 'Se connecter',
          onPressed: state.isLoading ? null : () => _submit(),
        ),
      ],
    );
  }
}

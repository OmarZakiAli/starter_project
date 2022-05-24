import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../utils/validator.utils.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  TextFieldBloc name =
      TextFieldBloc(name: "name", validators: [ValidatorUtils.name]);

  TextFieldBloc email =
      TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
  TextFieldBloc password =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);

  TextFieldBloc confirmPassword = TextFieldBloc(
      name: "conf_password", validators: [ValidatorUtils.password]);

  RegisterFormBloc() {
    addFieldBlocs(fieldBlocs: [email, password, confirmPassword, name]);
  }

  @override
  void onSubmitting() async {}
}

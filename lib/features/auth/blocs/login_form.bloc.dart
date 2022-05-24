import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:starter_project/core/routes/routes.dart';

import '../../../utils/validator.utils.dart';

class LoginFormBloc extends FormBloc<String, String> {
  TextFieldBloc email =
      TextFieldBloc(name: "email", validators: [ValidatorUtils.email]);
  TextFieldBloc password =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.password]);

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [email, password]);
  }

  @override
  void onSubmitting() async {
    Get.offAllNamed(Routes.main);
  }
}

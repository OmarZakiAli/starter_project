import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:starter_project/features/auth/blocs/register_form_bloc.dart';
import 'package:starter_project/theme/text_styles.dart';

import '../../../theme/input_decoration.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterFormBloc formBloc;
  @override
  void initState() {
    super.initState();
    formBloc = RegisterFormBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(title: "register"),
      body: FormBlocListener(
        formBloc: formBloc,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            const SizedBox(
              height: 16,
            ),
            TextFieldBlocBuilder(
              key: const ValueKey("name"),
              textFieldBloc: formBloc.name,
              decoration: inputDecoration(label: "name".tr),
            ),
            TextFieldBlocBuilder(
              key: const ValueKey("email"),
              textFieldBloc: formBloc.email,
              decoration: inputDecoration(label: "email".tr),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldBlocBuilder(
              key: const ValueKey("password"),
              textFieldBloc: formBloc.password,
              decoration: inputDecoration(label: "password".tr),
              suffixButton: SuffixButton.obscureText,
            ),
            TextFieldBlocBuilder(
              key: const ValueKey("confirm_password"),
              textFieldBloc: formBloc.confirmPassword,
              decoration: inputDecoration(label: "confirm_password".tr),
              suffixButton: SuffixButton.obscureText,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              key: const ValueKey("confirm"),
              title: "register".tr,
              onTap: () {
                formBloc.submit();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                    text: "already_have_acc!".tr,
                    style: context.textTheme.subTitle,
                    children: [
                      TextSpan(
                          text: "login".tr,
                          style: context.textTheme.subTitleBold
                              .copyWith(color: context.theme.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            })
                    ]),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

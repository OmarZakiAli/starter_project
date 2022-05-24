import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:starter_project/features/auth/blocs/login_form.bloc.dart';
import 'package:starter_project/theme/text_styles.dart';
import 'package:starter_project/widgets/app_bar.dart';
import 'package:starter_project/widgets/custom_button.dart';

import '../../../core/routes/routes.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/input_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginFormBloc formBloc;
  @override
  void initState() {
    super.initState();
    formBloc = LoginFormBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar(title: "login"),
      body: FormBlocListener(
        formBloc: formBloc,
        child: ListView(
          key: const ValueKey("login_scroll"),
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(
              height: 12,
            ),
            TextFieldBlocBuilder(
              key: const Key("email"),
              textFieldBloc: formBloc.email,
              decoration: inputDecoration(label: "email".tr),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldBlocBuilder(
              key: const Key("password"),
              textFieldBloc: formBloc.password,
              decoration: inputDecoration(label: "password".tr),
              suffixButton: SuffixButton.obscureText,
            ),
            Row(
              children: [
                TextButton(
                  child: Text("forget_pass?".tr),
                  onPressed: () {
                    // Get.dialog(const Dialog(
                    //   backgroundColor: Colors.transparent,
                    //   child: ResetPasswordWidget(),
                    // ));
                  },
                ),
              ],
            ),
            CustomButton(
              key: const ValueKey("login"),
              title: "login".tr,
              onTap: () {
                formBloc.submit();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              key: const ValueKey("register"),
              child: Text.rich(
                TextSpan(
                    text: "dont_have_acc!".tr,
                    style: context.textTheme.subTitle,
                    children: [
                      TextSpan(
                          text: "reg_new".tr,
                          style: context.textTheme.subTitleBold
                              .copyWith(color: Get.theme.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.register);
                            })
                    ]),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ValidatorUtils {
  static final req = MultiValidator([
    RequiredValidator(errorText: "req".tr),
  ]);
  static final email = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    EmailValidator(errorText: "valid_email".tr),
  ]);
  static final name = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    MinLengthValidator(3, errorText: "valid_name".tr),
  ]);

  static final password = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    MinLengthValidator(6, errorText: "pass_error_6".tr),
  ]);

  static final phone = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    MinLengthValidator(12, errorText: "phone_12".tr),
    MaxLengthValidator(12, errorText: "phone_12".tr),
  ]);

  static final code6 = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    MinLengthValidator(6, errorText: "code_6".tr),
    MaxLengthValidator(6, errorText: "code_6".tr),
  ]);

  static final code4 = MultiValidator([
    RequiredValidator(errorText: "req".tr),
    MinLengthValidator(4, errorText: "code_4".tr),
    MaxLengthValidator(4, errorText: "code_4".tr),
  ]);
}

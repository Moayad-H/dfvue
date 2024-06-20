import 'package:dfvue/Providers/logInProvider.dart';
import 'package:dfvue/localization/app_localization.dart';
import 'package:dfvue/theme/custom_button_style.dart';
import 'package:dfvue/utils/image_constant.dart';
import 'package:dfvue/utils/size_utils.dart';
import 'package:dfvue/utils/validation_functions.dart';
import 'package:dfvue/widgets/custom_elevated_button.dart';
import 'package:dfvue/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey formkey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Consumer<LogInProvider>(
            builder:
                (BuildContext context, LogInProvider provider, Widget? child) =>
                    SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          iconSize: MediaQuery.of(context).size.width * 0.08,
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'lbl_reset_password'.tr(context),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Image(
                              fit: BoxFit.cover,
                              height: 180,
                              width: 125,
                              image: AssetImage(ImageConstant.dfVuelogo))
                        ],
                      ),
                    ),
                    //"msg_enter_the_email"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            "msg_enter_the_email".tr(context),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomTextFormField(
                        autofocus: false,
                        controller: provider.resetPasswordController,
                        hintText: "lbl_email_i_d".tr(context),
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !isValidEmail(value, isRequired: true)) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 11.v),
                      ),
                    ),
                    SizedBox(
                      height: mediaQueryData.size.height / 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          height: 55.v,
                          width: 250.h,
                          text: "msg_send_instructions".tr(context),
                          buttonStyle:
                              CustomButtonStyles.outlineErrorContainerTL10,
                          alignment: Alignment.center,
                          // onPressed: onTapImgCdddfOne(context),
                          onPressed: () async {
                            await provider.resetPassword(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:core/common/utils/size_config.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';
import 'package:pinput/pinput.dart';
import 'package:core/common/constants.dart' as constants;

import '../bloc/pin_bloc.dart';

class CreatePinScreen extends StatelessWidget {
  CreatePinScreen({required this.pinType, required this.email, Key? key})
      : super(key: key);

  final String pinType;
  final String email;

  final pinController = TextEditingController();

  final sp = sl<SharedPreferences>();

  final ValueNotifier<String> firstPin = ValueNotifier('');
  final ValueNotifier<String> secondPin = ValueNotifier('');

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    debugPrint('TYPE: $pinType');
    debugPrint('EMAIL: $email');

    //size
    var size = MediaQuery.of(context).size;
    //pinput
    const focusedBorderColor = Colors.blue;
    const fillColor = Colors.white;
    const borderColor = Colors.grey;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background/bg_image.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Buat Pin Passcode',
                        style: TextStyle(
                          fontSize: getFont(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tolong buat pin anda',
                        style: TextStyle(
                          fontSize: getFont(16),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: ValueListenableBuilder(
                      valueListenable: firstPin,
                      builder: (context, v, w) => Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Pinput(
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            controller: pinController,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            validator: (value) {
                              if (firstPin.value != '') {
                                if (value != firstPin.value) {
                                  return 'Pin harus sama';
                                }
                              }
                              return null;
                            },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {
                              if (formKey.currentState!.validate()) {
                                context.goNamed(AppRouter.registerPin,
                                    queryParams: {
                                      'pin_type': pinType,
                                      'email': email,
                                      'first_pin': pin,
                                    });
                              }
                              debugPrint('onCompleted: $pin');
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: focusedBorderColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: focusedBorderColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

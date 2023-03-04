import 'package:core/common/utils/size_config.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';
import 'package:pinput/pinput.dart';
import 'package:core/common/constants.dart' as constants;

import '../bloc/pin_bloc.dart';

class PinScreen extends StatelessWidget {
  PinScreen(
      {required this.pinType,
      required this.email,
      this.firstPin = '',
      Key? key})
      : super(key: key);

  final String pinType;
  final String email;
  final String firstPin;

  final pinController = TextEditingController();

  final sp = sl<SharedPreferences>();

  final ValueNotifier<String> secondPin = ValueNotifier('');

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    debugPrint('TYPE: $pinType');
    debugPrint('EMAIL: $email');
    debugPrint('FIRST PIN: $firstPin');

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
    return BlocProvider(
      create: (context) => sl<PinBloc>(),
      child: BlocConsumer<PinBloc, PinState>(
        listener: (context, state) {
          if (state is Loading) {
            EasyLoading.show();
          } else if (state is Success) {
            EasyLoading.dismiss();
            context.goNamed(AppRouter.home);
          } else if (state is ResendOTPSuccess) {
            EasyLoading.dismiss();
            context.goNamed(AppRouter.registerOtp, queryParams: {
              'email': email,
              'otp_type': 'register',
            });
          } else if (state is ResendOTPError) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is Error) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
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
                            'Pin Passcode',
                            style: TextStyle(
                              fontSize: getFont(24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tolong masukkan pin anda',
                            style: TextStyle(
                              fontSize: getFont(16),
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Pinput(
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              controller: pinController,
                              focusNode: focusNode,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: defaultPinTheme,
                              validator: (value) {
                                if (firstPin != '') {
                                  if (value != firstPin) {
                                    return 'Pin harus sama';
                                  }
                                }
                                return null;
                              },
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<PinBloc>(context)
                                      .add(DoPinCheck(
                                    email: email,
                                    pin: pin,
                                    isCreate:
                                        pinType == 'register' ? true : false,
                                    token: sl<SharedPreferences>()
                                        .getString(constants.PREF_KEY_TOKEN)!,
                                  ));
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
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
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
                      InkWell(
                        onTap: () {
                          BlocProvider.of<PinBloc>(context)
                              .add(DoResendOtp(email: email));
                        },
                        child: Text(
                          'Lupa PIN',
                          style: TextStyle(
                            fontSize: getFont(16),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sp.remove(constants.PREF_KEY_TOKEN);
                          sp.remove(constants.PREF_KEY_EMAIL);
                          context.goNamed('splash');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            Text(
                              'LOGOUT',
                              style: TextStyle(
                                fontSize: getFont(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

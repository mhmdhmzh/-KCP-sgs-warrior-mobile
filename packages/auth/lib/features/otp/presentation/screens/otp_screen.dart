import 'dart:async';

import 'package:auth/features/pin/presentation/screens/pin_screen.dart';
import 'package:core/common/utils/size_config.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';
import 'package:pinput/pinput.dart';
import 'package:core/common/constants.dart' as constants;

import '../bloc/otp_bloc.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({required this.email, required this.otpType, Key? key})
      : super(key: key);
  final String email;
  final String otpType;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final ValueNotifier<String> pin = ValueNotifier('');
  final pinController = TextEditingController();

  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  late Timer _timer;
  final ValueNotifier<int> _start = ValueNotifier(300);
  bool isLoading = false;

  @override
  void initState() {
    debugPrint(widget.otpType);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start.value == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start.value--;
          });
        }
      },
    );
  }

  String intToTimeLeft({
    required int value,
    bool isSecond = false,
    bool isMinute = false,
    bool isHour = false,
  }) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();
    if (isSecond) {
      String result = secondsLeft;
      return result;
    } else if (isMinute) {
      String result = "$minuteLeft:$secondsLeft";
      return result;
    } else {
      String result = "$hourLeft:$minuteLeft:$secondsLeft";
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
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
      create: (context) => sl<OtpBloc>(),
      child: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is Loading) {
            EasyLoading.show();
          } else if (state is Success) {
            EasyLoading.dismiss();
            sl<SharedPreferences>()
                .setString(constants.PREF_KEY_TOKEN, state.resp.data.token);
            sl<SharedPreferences>().setString(
                constants.PREF_KEY_EMAIL, state.resp.data.user.email);
            sl<SharedPreferences>().setString(constants.PREF_KEY_WAREHOUSE_ID,
                state.resp.data.user.warehouseId.toString());
            sl<SharedPreferences>().setString(constants.PREF_KEY_WAREHOUSE_NAME,
                state.resp.data.user.warehouseName);
            if (widget.otpType == 'register') {
              debugPrint('REGISTER');
              context.goNamed(AppRouter.createPin, queryParams: {
                'pin_type': widget.otpType,
                'email': widget.email,
              });
            } else {
              debugPrint('LOGIN');
              context.goNamed(AppRouter.loginPin, queryParams: {
                'pin_type': widget.otpType,
                'email': widget.email,
              });
            }
          } else if (state is Error) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
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
                            'OTP Verification',
                            style: TextStyle(
                              fontSize: getFont(24),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'We sent your code to',
                            style: TextStyle(
                              fontSize: getFont(16),
                            ),
                          ),
                          Text(
                            widget.email,
                            style: TextStyle(
                              fontSize: getFont(16),
                              color: Colors.blue,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'This code will expired in ',
                                style: TextStyle(
                                  fontSize: getFont(14),
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: _start,
                                builder: (context, _, widget) {
                                  return Text(
                                    intToTimeLeft(
                                      value: _start.value,
                                      isMinute: true,
                                    ),
                                    style: TextStyle(
                                      fontSize: getFont(14),
                                      color: _start.value == 0
                                          ? Colors.red
                                          : Colors.blue,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      ValueListenableBuilder(
                        valueListenable: pin,
                        builder: (context, _, w) => Container(
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
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              onCompleted: (v) {
                                debugPrint('onCompleted: ${pin.value}');
                                BlocProvider.of<OtpBloc>(context).add(
                                    DoOtpCheck(
                                        email: widget.email,
                                        otp: pin.value,
                                        type: widget.otpType));
                              },
                              onChanged: (value) {
                                pin.value = value;
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
                      ValueListenableBuilder(
                        valueListenable: _start,
                        builder: (context, _, widget) => Text(
                          'Kirim ulang OTP',
                          style: TextStyle(
                            fontSize: getFont(16),
                            color:
                                _start.value == 0 ? Colors.blue : Colors.grey,
                          ),
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

import 'package:auth/features/reusable_widgets.dart';
import 'package:core/common/utils/size_config.dart';
import 'package:core/common/utils/spaces.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/route/routes.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<String> email = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is Loading) {
              EasyLoading.show(status: 'Loading..');
            } else if (state is Success) {
              EasyLoading.dismiss();
              context.push('/${AppRouter.otp}', extra: email.value);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${state.resp.data.name} is logged in'),
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
          child: Stack(
            children: [
              Image.asset(
                'assets/background/bg_image.jpeg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: size.height,
                color: Colors.white70,
              ),
              SafeArea(
                child: Container(
                  height: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HeightGap(height: getHeight(200)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'HALO!',
                                style: TextStyle(
                                  fontSize: getFont(60),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Selamat datang kembali!',
                                style: TextStyle(
                                  fontSize: getFont(20),
                                ),
                              ),
                            ),
                            const HeightGap(height: 30),
                            Form(
                              key: _formKey,
                              child: CustomTextInput(
                                label: 'Email',
                                hinText: 'Masukkan email anda',
                                prefixIcon: const Icon(Icons.email),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email.value = value;
                                },
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-_]+\.[a-zA-Z]+")
                                      .hasMatch(value!);
                                  if (value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  }
                                  if (!emailValid) {
                                    return 'Tolong masukkan email yang benar';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        HeightGap(height: getHeight(50)),
                        Expanded(
                          child: Column(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: email,
                                builder: (context, _, widget) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: size.height / 17,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<LoginBloc>(context)
                                                .add(
                                              Login(
                                                email: email.value,
                                                media: '1',
                                              ),
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                        ),
                                        child: Text(
                                          'Lanjutkan',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: getFont(20.5)),
                                        )),
                                  );
                                },
                              ),
                              HeightGap(height: getHeight(25)),
                              SizedBox(
                                width: double.infinity,
                                height: size.height / 17,
                                child: ElevatedButton(
                                    onPressed: () =>
                                        context.push('/${AppRouter.register}'),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.grey),
                                    ),
                                    child: Text(
                                      'Daftar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: getFont(20.5)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

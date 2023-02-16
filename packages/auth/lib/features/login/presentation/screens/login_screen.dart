import 'package:core/common/utils/spaces.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: CachedNetworkImage(
                imageUrl:
                    'https://i.pinimg.com/736x/f1/97/d3/f197d3d9ae6e1178eaa6eaf23009651e.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: size.height,
              color: Colors.white70,
            ),
            Container(
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    HeightGap(height: size.height * 0.2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'HELLO',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Masuk menggunakan akunmu',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const HeightGap(height: 30),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Row(
                            children: [
                              const Text(
                                'Masuk',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const WidthGap(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Tidak punya akun? ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Buat akun',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const HeightGap(height: 10),
                        const Text(
                          'PT. Sinergi Global Service',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

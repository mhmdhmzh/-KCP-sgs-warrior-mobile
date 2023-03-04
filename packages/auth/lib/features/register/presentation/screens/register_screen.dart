import 'dart:convert';
import 'dart:io';

import 'package:auth/features/otp/presentation/screens/otp_screen.dart';
import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:core/common/utils/size_config.dart';
import 'package:core/common/utils/spaces.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation/route/routes.dart';

import '../bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<String> name = ValueNotifier('');

  ValueNotifier<String> email = ValueNotifier('');

  ValueNotifier<String> phone = ValueNotifier('');

  ValueNotifier<String> sex = ValueNotifier('');

  ValueNotifier<String> dob = ValueNotifier('');

  ValueNotifier<String> address = ValueNotifier('');

  ValueNotifier<String> provinsi = ValueNotifier('');

  ValueNotifier<String?> kota = ValueNotifier('');

  ValueNotifier<String?> kecamatan = ValueNotifier('');

  ValueNotifier<TextEditingController> dobController =
      ValueNotifier(TextEditingController());

  // sex
  ValueNotifier<List<DropdownMenuItem<String>>> menuSex = ValueNotifier([
    const DropdownMenuItem(value: '1', child: Text('Laki-Laki')),
    const DropdownMenuItem(value: '2', child: Text('Perempuan')),
  ]);

  // provinsi
  ValueNotifier<List<DropdownMenuItem<String>>> menuProvinsi = ValueNotifier([
    const DropdownMenuItem(value: '1', child: Text('DKI Jakarta')),
    const DropdownMenuItem(value: '2', child: Text('Jawa Barat')),
  ]);

  // kabupaten / kota
  ValueNotifier<List<DropdownMenuItem<String>>> menuKota = ValueNotifier([
    const DropdownMenuItem(value: '1', child: Text('Jakarta Timur')),
    const DropdownMenuItem(value: '2', child: Text('Jakarta Barat')),
  ]);

  // kecamatan
  ValueNotifier<List<DropdownMenuItem<String>>> menuKecamatan = ValueNotifier([
    const DropdownMenuItem(value: '1', child: Text('Duren Sawit')),
    const DropdownMenuItem(value: '2', child: Text('Pulo Gadung')),
  ]);

  _selectBirthDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2006),
        firstDate: DateTime(1900),
        lastDate: DateTime(2006));

    if (selectedDate != null) {
      dob.value = DateFormat('dd-MM-yyy').format(selectedDate);
      dobController.value.text = _formatDate(selectedDate);
    }
  }

  _formatDate(DateTime date) {
    final formatter = DateFormat('dd MMMM yyyy');
    final formated = formatter.format(date);
    return formated;
  }

  ValueNotifier<File> avatar = ValueNotifier(File(''));

  String avatarBase64 = '';

  ValueNotifier<File> idCard = ValueNotifier(File(''));

  String idCardBase64 = '';

  Future pickImage({required bool isAvatar}) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      if (isAvatar) {
        avatar.value = imageTemp;
        setState(() {
          avatarBase64 = base64Converter(imageTemp);
        });
      } else {
        idCard.value = imageTemp;
        setState(() {
          idCardBase64 = base64Converter(imageTemp);
        });
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  base64Converter(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();

    String result = base64Encode(imageBytes);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            EasyLoading.show();
          } else if (state is RegisterSuccess) {
            EasyLoading.dismiss();
            context.goNamed(AppRouter.registerOtp, queryParams: {
              'email': email.value,
              'otp_type': 'register',
            });
          } else if (state is RegisterError) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is RegisterEmpty) {}
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
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HeightGap(height: getHeight(100)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontSize: getFont(60),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Masukkan data diri anda!',
                                style: TextStyle(
                                  fontSize: getFont(16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        HeightGap(height: getHeight(50)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text('Avatar'),
                                ValueListenableBuilder(
                                  valueListenable: avatar,
                                  builder: (c, File file, w) {
                                    if (file.path == '') {
                                      return MaterialButton(
                                        color: Colors.blue,
                                        onPressed: () =>
                                            pickImage(isAvatar: true),
                                        child: const Text(
                                          "Masukkan avatar",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        onTap: () => pickImage(isAvatar: true),
                                        child: CircleAvatar(
                                          radius: getHeight(100),
                                          backgroundImage: FileImage(
                                            file,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                const Text('KTP'),
                                ValueListenableBuilder(
                                  valueListenable: idCard,
                                  builder: (c, File file, w) {
                                    if (file.path == '') {
                                      return MaterialButton(
                                        color: Colors.blue,
                                        onPressed: () =>
                                            pickImage(isAvatar: false),
                                        child: const Text(
                                          "Masukkan KTP",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        onTap: () => pickImage(isAvatar: false),
                                        child: SizedBox(
                                          height: getHeight(200),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              file,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      HeightGap(height: getHeight(35)),
                                      CustomTextInput(
                                        label: 'Nama',
                                        hinText: 'Masukkan nama anda',
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) {
                                          name.value = value;
                                        },
                                        validator: (value) {
                                          if (value!.length < 4) {
                                            return 'Nama harus lebih dari 4 karakter';
                                          }
                                          if (value.isEmpty) {
                                            return 'Nama tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                      HeightGap(height: getHeight(35)),
                                      CustomTextInput(
                                        label: 'Email',
                                        hinText: 'Masukkan email anda',
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                      HeightGap(height: getHeight(35)),
                                      CustomTextInput(
                                        label: 'phone',
                                        hinText: 'Masukkan nomor telepon anda',
                                        prefixText: '+62 ',
                                        keyboardType: TextInputType.phone,
                                        onChanged: (value) {
                                          phone.value = value;
                                        },
                                        validator: (value) {
                                          if (value!.length < 4) {
                                            return 'Nama harus lebih dari 4 karakter';
                                          }
                                          if (value.isEmpty) {
                                            return 'Nama tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                      HeightGap(height: getHeight(35)),
                                      CustomDropDownInput(
                                        label: 'Jenis Kelamin',
                                        hinText: 'Pilih jenis kelamin',
                                        onChanged: (value) =>
                                            sex.value = value!,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Jenis kelamin tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                        items: menuSex.value,
                                      ),
                                      HeightGap(height: getHeight(35)),
                                      CustomTextInput(
                                        controller: dobController.value,
                                        label: 'Tanggal Lahir',
                                        hinText: 'Pilih tanggal lahir',
                                        keyboardType: TextInputType.datetime,
                                        onTap: () => _selectBirthDate(context),
                                        onChanged: (value) {
                                          name.value = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Tanggal Lahir tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                      HeightGap(height: getHeight(35)),
                                      CustomTextInput(
                                        label: 'Alamat',
                                        hinText: 'Masukkan alamat anda',
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        onChanged: (value) {
                                          address.value = value;
                                        },
                                        validator: (value) {
                                          if (value!.length < 4) {
                                            return 'Alamat harus lebih dari 4 karakter';
                                          }
                                          if (value.isEmpty) {
                                            return 'Alamat tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                      HeightGap(height: getHeight(35)),
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                        builder: (context, state) {
                                          if (state is RegisterInitial) {
                                            BlocProvider.of<RegisterBloc>(
                                                    context)
                                                .add(GetRegion());
                                            return Container();
                                          } else if (state is RegionLoading) {
                                            return SizedBox(
                                              height: getHeight(50),
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          } else if (state is RegionSuccess) {
                                            return DropdownRegisterComponent(
                                              provinsi: provinsi,
                                              kota: kota,
                                              kecamatan: kecamatan,
                                              regionEntity: state.regionEntity,
                                            );
                                          } else if (state is RegionError) {
                                            return const Text(
                                                'something is not right');
                                          } else if (state is RegionEmpty) {
                                            return const Text('no data..');
                                          } else {
                                            return Column(
                                              children: [
                                                CustomDropDownInput(
                                                  label: 'Provinsi',
                                                  hinText: 'Pilih provinsi',
                                                  onChanged: (value) =>
                                                      provinsi.value = value!,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Provinsi tidak boleh kosong';
                                                    }
                                                    return null;
                                                  },
                                                  items: menuProvinsi.value,
                                                ),
                                                HeightGap(
                                                    height: getHeight(35)),
                                                CustomDropDownInput(
                                                  label: 'Kabupaten / Kota',
                                                  hinText:
                                                      'Pilih kabupaten / kota',
                                                  onChanged: (value) =>
                                                      kota.value = value!,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Kabupaten / kota tidak boleh kosong';
                                                    }
                                                    return null;
                                                  },
                                                  items: menuKota.value,
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                HeightGap(height: getHeight(25)),
                                ValueListenableBuilder(
                                    valueListenable: provinsi,
                                    builder: (context, v, w) {
                                      return SizedBox(
                                        width: double.infinity,
                                        height: size.height / 17,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // if (avatarBase64 == '' &&
                                              //     idCardBase64 == '' &&
                                              //     provinsi.value == '' &&
                                              //     kota.value == '' &&
                                              //     kecamatan.value == '') {
                                              //   ScaffoldMessenger.of(context)
                                              //       .showSnackBar(
                                              //     const SnackBar(
                                              //       content: Text(
                                              //           'Tolong lengkapi data'),
                                              //     ),
                                              //   );
                                              //   return null;
                                              // }
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                BlocProvider.of<RegisterBloc>(
                                                        context)
                                                    .add(DoRegister(
                                                        req: RegisterReqEntity(
                                                  provinceId: provinsi.value,
                                                  avatar64: avatarBase64,
                                                  idCard64: idCardBase64,
                                                  name: name.value,
                                                  email: email.value,
                                                  phone: phone.value,
                                                  sex: sex.value,
                                                  dob: dob.value,
                                                  address: address.value,
                                                  subdistrictId:
                                                      kecamatan.value!,
                                                  placeId: kota.value!,
                                                )));
                                              }
                                            },
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                            ),
                                            child: Text(
                                              'Daftar',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: getFont(20.5)),
                                            )),
                                      );
                                    }),
                                HeightGap(height: getHeight(25)),
                              ],
                            ),
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

class DropdownRegisterComponent extends StatelessWidget {
  DropdownRegisterComponent({
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.regionEntity,
    Key? key,
  }) : super(key: key);

  ValueNotifier<String> provinsi;

  ValueNotifier<String?> kota;

  ValueNotifier<String?> kecamatan;

  final RegionEntity regionEntity;

  ValueNotifier<List<DropdownMenuItem<String>>> subdistrictList =
      ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    // var alreadyList = [];
    // for (int x = 0; x < regionEntity.subdistrict.subdistrictData.length; x++) {
    //   if (!alreadyList.contains(
    //       regionEntity.subdistrict.subdistrictData[x].subdistrictId)) {
    //     alreadyList
    //         .add(regionEntity.subdistrict.subdistrictData[x].subdistrictId);
    //     print(regionEntity.subdistrict.subdistrictData[x].subdistrictId);
    //   }
    // }
    // print('==============================================');
    // print(alreadyList.length);
    // print(regionEntity.subdistrict.subdistrictData.length);
    return Column(
      children: [
        CustomDropDownInput(
          label: 'Provinsi',
          hinText: 'Pilih provinsi',
          onChanged: (value) async {
            provinsi.value = value!;
            kota.value = regionEntity.place.placeData
                .where((element) => element.provinceId.toString() == value)
                .first
                .cityId
                .toString();

            kecamatan.value = regionEntity.subdistrict.subdistrictData
                .where((element) => element.cityId.toString() == kota.value)
                .first
                .subdistrictId
                .toString();
            subdistrictList.value = regionEntity.subdistrict.subdistrictData
                .where((element) => element.cityId.toString() == kota.value)
                .map(
                  (e) => DropdownMenuItem(
                    value: e.subdistrictId.toString(),
                    child: Text(
                      e.subdistrictName,
                    ),
                  ),
                )
                .toList();
            debugPrint(value);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Provinsi tidak boleh kosong';
            }
            return null;
          },
          items: regionEntity.province.provinceData
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e.provinceId.toString(),
                  child: Text(e.province),
                ),
              )
              .toList(),
        ),
        HeightGap(height: getHeight(35)),
        ValueListenableBuilder(
          valueListenable: provinsi,
          builder: (c, v, w) {
            if (v != '') {
              return ValueListenableBuilder(
                valueListenable: kota,
                builder: (cc, __, ww) {
                  return CustomDropDownInput(
                    dropdownValue: kota.value,
                    label: 'Kabupaten / Kota',
                    hinText: 'Pilih kabupaten / kota',
                    onChanged: (value) {
                      kota.value = value!;
                      kecamatan.value = regionEntity.subdistrict.subdistrictData
                          .where((element) =>
                              element.cityId.toString() == kota.value)
                          .first
                          .subdistrictId
                          .toString();
                      subdistrictList.value = regionEntity
                          .subdistrict.subdistrictData
                          .where(
                              (element) => element.cityId.toString() == value)
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.subdistrictId.toString(),
                              child: Text(
                                e.subdistrictName,
                              ),
                            ),
                          )
                          .toList();
                      debugPrint(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kabupaten / kota tidak boleh kosong';
                      }
                      return null;
                    },
                    items: regionEntity.place.placeData
                        .where((element) => element.provinceId.toString() == v)
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.cityId.toString(),
                            child: Text(
                              e.cityName,
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
        HeightGap(height: getHeight(35)),
        ValueListenableBuilder(
          valueListenable: kota,
          builder: (c, v, w) {
            if (v != '') {
              return ValueListenableBuilder(
                valueListenable: subdistrictList,
                builder: (cc, __, ww) {
                  return CustomDropDownInput(
                    dropdownValue: kecamatan.value,
                    label: 'Kecamatan',
                    hinText: 'Pilih kecamatan',
                    onChanged: (value) => kecamatan.value = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kecamatan tidak boleh kosong';
                      }
                      return null;
                    },
                    items: subdistrictList.value,
                  );
                },
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:core/common/constants.dart' as constant;

class CommonUtils {
  var formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  static var alphaNumericRegex = RegExp('[^A-Za-z0-9]');
  static var numRegex = RegExp(r'[^0-9]');
  static var alphaRegex = RegExp(r'[^a-zA-Z]');
  var simpleFormatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
  DateTime now = DateTime.now();

  currency(int digit) => formatCurrency.format(digit);
  simpleCurrency(int digit) => simpleFormatCurrency.format(digit);

  String getExpiredDayLeft(DateTime end) {
    var dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(end.toString(), true);
    var ends = dateTime.toLocal();

    var diff = ends.difference(now).inMinutes;
    var result = "${diff} ${'Minute left'}";

    if (diff < 0) {
      result = 'Expired left';
    }

    if (diff > 60) {
      var hour = diff / 60;
      result = "${hour.ceil()} ${'Hour left'}";
    }
    ;

    if (diff > 1440) {
      var day = diff / 1440;
      result = "${day.ceil()} ${'Day left'}";
    }
    ;

    return result;
  }

  String timeDiffCreated(DateTime created_at) {
    var format = DateFormat("yyyy-MM-dd HH:mm:ss");
    var created_at_local = format.parse(created_at.toString(), true);
    var time1 = format.parse(now.toString(), true);
    var time2 = format.parse(created_at_local.toLocal().toString(), true);

    var diff = time1.difference(time2);
    var result = 'Time ago';

    if (diff.inDays < 30) {
      result = "${diff.inDays} ${'Day ago'}";
    }

    if (diff.inHours < 24) {
      result = "${diff.inHours} ${'Hour ago'}";
    }

    if (diff.inMinutes < 60) {
      result = "${diff.inMinutes} ${'Minute ago'}";
    }

    if (diff.inSeconds < 60) {
      result = 'Time ago';
    }

    return result;
  }

  bool getExpiredTime(DateTime end) {
    var dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(end.toString(), true);
    var ends = dateTime.toLocal();

    var diff = ends.difference(now).inMinutes;
    var result = false;

    if (diff < 0) {
      result = true;
    }

    return result;
  }

  String productQuantityUnit(List<dynamic> list) {
    var qtyUnit = "";
    var offerExtends = [];
    for (var offerExtend in list) {
      if (!offerExtends.contains(offerExtend.productQuantityUnit) &&
          offerExtend.productQuantityUnit != "") {
        offerExtends.add(offerExtend.productQuantityUnit);
      }
    }
    if (offerExtends.isNotEmpty) {
      qtyUnit = offerExtends.join("/");
    }

    return qtyUnit;
  }

  bool passwordComplexity(String password) {
    var valid = true;
    if (alphaRegex.hasMatch(password.replaceAll(numRegex, "")) &&
        numRegex.hasMatch(password.replaceAll(alphaRegex, ""))) {
      valid = false;
    }
    return valid;
  }
}

class MultiValueListenableBuilder<A, B> extends StatelessWidget {
  const MultiValueListenableBuilder({
    required this.first,
    required this.second,
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueNotifier<A> first;
  final ValueNotifier<B> second;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
        valueListenable: first,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
            valueListenable: second,
            builder: (context, b, __) {
              return builder(context, a, b, child);
            },
          );
        },
      );
}

class FormInputSearch extends StatelessWidget {
  FormInputSearch({
    Key? key,
    this.text,
    this.autoFocus = false,
    this.autoValidateMode,
    this.borderOutlineColor,
    this.controller,
    this.cursorColor,
    this.textColor,
    this.fieldSubmitted,
    this.focusBorderOutlineColor,
    this.focusNode,
    this.hint,
    this.inputAction,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.obsecureText = false,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.prefixIcon,
    this.readOnly = false,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.textWeight,
    this.validator,
  }) : super(key: key);

  var text,
      keyboardType,
      maxLines,
      validator,
      onSaved,
      onTap,
      fieldSubmitted,
      prefixIcon,
      inputAction,
      focusNode,
      suffixIcon,
      controller,
      obsecureText = false,
      maxLength,
      hint,
      onChanged,
      readOnly = false,
      inputFormatters,
      autoFocus = false,
      textAlign,
      autoValidateMode,
      borderOutlineColor,
      focusBorderOutlineColor,
      cursorColor,
      textColor,
      textWeight;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      // autovalidateMode: autoValidateMode,
      controller: controller,
      inputFormatters: inputFormatters,
      obscureText: obsecureText,
      autofocus: autoFocus,
      textInputAction: inputAction,
      // onFieldSubmitted: fieldSubmitted,
      maxLength: maxLength,
      focusNode: focusNode,
      readOnly: readOnly,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontWeight: textWeight,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 23, maxHeight: 20),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
        ),
        focusColor: Colors.white,
      ),
      // validator: validator,
      // onSaved: onSaved,
      // onSubmitted: onChanged,
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}

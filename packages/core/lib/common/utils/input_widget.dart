import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    required this.label,
    required this.hinText,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
    this.prefixIcon,
    this.controller,
    this.prefixText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String? label, hinText, prefixText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  Function()? onTap;
  TextEditingController? controller = TextEditingController();
  FormFieldValidator<String>? validator;

  final ValueNotifier<FocusNode> _focus = ValueNotifier(FocusNode());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: Colors.white,
        ),
        child: TextFormField(
          focusNode: _focus.value,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            prefixText: prefixText,
            label: Text(label!),
            hintText: hinText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            prefixIcon: prefixIcon,
          ),
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}

class CustomDropDownInput extends StatelessWidget {
  CustomDropDownInput({
    required this.label,
    required this.hinText,
    required this.onChanged,
    required this.validator,
    required this.items,
    this.keyboardType,
    this.prefixIcon,
    this.prefixText,
    Key? key,
  }) : super(key: key);

  final String? label, hinText, prefixText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Function onChanged;
  FormFieldValidator<String>? validator;
  List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixText: prefixText,
            label: Text(label!),
            hintText: hinText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            prefixIcon: prefixIcon,
          ),
          dropdownColor: Colors.white,
          items: items,
          onChanged: (value) => onChanged(),
          isExpanded: true,
          iconDisabledColor: Colors.black,
          iconEnabledColor: Colors.black,
        ),
      ),
    );
  }
}

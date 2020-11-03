import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool loading;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final ValueChanged<String> onChanged;
  final IconData suffixIcon;
  final String hintText;
  final int maxLines;

  AppInputField({
    @required this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.loading = false,
    this.maxLines = 1,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        validator: validator,
        readOnly: loading,
        style: TextStyle(
          color: ColorUtil.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textInputAction: TextInputAction.done,
        controller: controller,
        cursorColor: ColorUtil.primaryColor,
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon == null
              ? suffixIcon
              : Icon(
            suffixIcon,
            color: ColorUtil.greyColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
            borderRadius: AppUtil.borderRadius,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUtil.greyColor,
              width: 0.5,
            ),
            borderRadius: AppUtil.borderRadius,
          ),
          disabledBorder: AppUtil.lightGreyOutLineInputBorder,
          enabledBorder: AppUtil.lightGreyOutLineInputBorder,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorUtil.greyColor,
          ),
        ),
      ),
    );
  }
}

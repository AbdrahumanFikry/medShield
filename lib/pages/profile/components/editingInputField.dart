import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditingInputField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final String labelText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final bool isLoading;

  const EditingInputField({
    @required this.labelText,
    this.hintText,
    this.onChanged,
    @required this.initialValue,
    this.validator,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(
              color: ColorUtil.primaryColor,
              fontSize: 36.sp,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorUtil.lightGreyColor,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isLoading ? Colors.white : ColorUtil.lightGreyColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isLoading ? Colors.white : ColorUtil.primaryColor,
                ),
              ),
              contentPadding: EdgeInsets.all(
                10.0,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: ColorUtil.greyColor,
              ),
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
            initialValue: initialValue,
            cursorColor: Colors.indigo,
            readOnly: isLoading,
            validator: validator,
            onChanged: onChanged,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

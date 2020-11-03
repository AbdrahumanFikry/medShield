import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class AppDropDownMenu extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  @required
  final List<String> listElements;
  final FormFieldValidator<String> validator;

  AppDropDownMenu({
    this.hintText = '',
    this.onChanged,
    this.listElements,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    String currentValue;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: FormField<String>(
        validator: validator,
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
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
              errorStyle: TextStyle(
                color: ColorUtil.errorColor,
                fontSize: 16.0,
              ),
              hintStyle: TextStyle(
                color: ColorUtil.greyColor,
                fontSize: 16.0,
              ),
              hintText: hintText,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentValue,
                isDense: true,
                onChanged: onChanged,
                isExpanded: false,
                hint: Text(
                  currentValue ?? hintText,
                  style: TextStyle(
                    color: ColorUtil.greyColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Colors.grey,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorUtil.greyColor,
                ),
                items: listElements.map(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            color: ColorUtil.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

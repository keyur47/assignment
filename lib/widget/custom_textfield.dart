
import 'package:assignment/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final bool? showCursor;
  final FontWeight? fontWeight;
  final TextEditingController? controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? fontSize;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? hintText;
  final Color? hintTextColor;
  final double? hintFontSize;
  final FontWeight? hintTextWeight;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;
  final Color? enableColor;
  final Color? disabledColor;
  final Color? focusedColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final TextCapitalization? textCapitalization;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputAction? textInputAction;
  final bool? copy;
  final double? textFieldHeight;
  final List<BoxShadow>? boxShadow;

  CustomTextField({
    Key? key,
    this.textInputFormatter,
    this.boxShadow,
    this.onFieldSubmitted,
    this.fontWeight,
    this.showCursor,
    this.onChanged,
    this.maxLine = 1,
    this.maxLength,
    this.radius,
    this.fontSize,
    this.fillColor,
    this.textColor,
    this.disabledColor,
    this.isPassword = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.hintTextColor,
    this.hintFontSize,
    this.hintTextWeight,
    this.textAlign,
    this.textAlignVertical,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.enableColor,
    this.focusedColor,
    this.cursorColor,
    this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.copy = false,
    this.readOnly = false,
    this.textCapitalization,
    this.textInputAction,
    this.validator,
    this.textFieldHeight,
  }) : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscure,
      builder: (context, bool isObscure, _) {
        if (!isPassword) {
          isObscure = false;
        }
        return TextFormField(
          autofocus: false,
          onFieldSubmitted: onFieldSubmitted,
          showCursor: showCursor ?? true,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly,
          style: TextStyle(
            color: textColor ?? AppTheme.black,
            fontSize: fontSize ?? 18,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
          onTap: onTap,
          obscureText: isObscure,
          inputFormatters: textInputFormatter,
          textInputAction: textInputAction,
          obscuringCharacter: '*',
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine,
          maxLength: maxLength,
          keyboardType: keyboardType,
          focusNode: focusNode,
          textAlignVertical: textAlignVertical,
          cursorColor: cursorColor ?? AppTheme.black,
          textAlign: textAlign ?? TextAlign.start,
          enabled: enabled,
          validator: validator,
          toolbarOptions:
              ToolbarOptions(copy: copy ?? false, cut: copy ?? false, paste: copy ?? false, selectAll: copy ?? false),
          // toolbarOptions: const ToolbarOptions(copy: false, cut: false, paste: false, selectAll: false),
          decoration: InputDecoration(
            errorMaxLines: 1,
            prefix: prefixWidget,
            contentPadding: contentPadding,
            isDense: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon == null && isPassword
                ? IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _isObscure.value = !isObscure;
                    },
                  )
                : suffixIcon,
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor ?? AppTheme.black,
              fontSize: hintFontSize ??  18,
              fontWeight: hintTextWeight ?? FontWeight.w400,
            ),
            filled: true,
            fillColor: fillColor ?? AppTheme.white,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(color: focusedColor ?? AppTheme.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(color: focusedColor ?? AppTheme.black),
            ),
            // border: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(color: focusedColor ?? AppTheme.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
              borderSide: BorderSide.none,
              // borderSide: BorderSide(color: focusedColor ?? AppTheme.black),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}

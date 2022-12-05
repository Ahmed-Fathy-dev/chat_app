import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.icon,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.errorText,
    this.onTap,
    this.maxLines,
    this.initialValue,
    this.readOnly = false,
    this.roundCorner,
    this.labelText,
  }) : super(key: key);
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? icon, suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final String? labelText;
  final bool readOnly;
  final double? roundCorner;
  final int? maxLines;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintStyle:
            TextStyle(color: context.colorSchemes.onBackground, fontSize: 14),
        labelText: labelText,
      ),
    );
  }
}

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.label,
    this.icon,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.errorText,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Icon? icon, suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? label;
  final bool readOnly;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        hintStyle:
            TextStyle(color: context.colorSchemes.onBackground, fontSize: 14),
        errorText: errorText,
        hintText: label,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class CustomPTextField extends StatelessWidget {
  const CustomPTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.validator,
    required this.hintText,
    this.icon,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.errorText,
    this.onTap,
    this.initialValue,
    this.readOnly = false,
    this.roundCorner,
    this.labelText,
    this.obscureText = true,
  }) : super(key: key);
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? icon, suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final String? labelText;
  final bool readOnly;
  final double? roundCorner;
  final void Function()? onTap;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      obscuringCharacter: '*',
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintStyle:
            TextStyle(color: context.colorSchemes.onBackground, fontSize: 14),
        labelText: labelText,
      ),
    );
  }
}

class CustomChatField extends StatelessWidget {
  const CustomChatField({
    Key? key,
    required this.fieldKey,
    required this.name,
    this.onChanged,
    this.confirmEqual,
    this.controller,
  }) : super(key: key);
  final String fieldKey;
  final String name;
  final void Function(String?)? onChanged;
  final String? confirmEqual;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: fieldKey,
      decoration: InputDecoration(
        hintText: name,
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: 'This Field Required',
          ),
          // if (confirmEqual != null)
          //   FormBuilderValidators.equal(confirmEqual!,
          //       errorText: 'Should Equal')
        ],
      ),
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
    );
  }
}

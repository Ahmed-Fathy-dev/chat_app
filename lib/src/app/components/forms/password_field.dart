import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/utils/const_file.dart';


class CustomPasswordField extends HookWidget {
  const CustomPasswordField({
    Key? key,
    required this.fieldKey,
    required this.name,
    required this.onChanged,
    this.confirmEqual,
  }) : super(key: key);
  final String fieldKey;
  final String name;
  final void Function(String?) onChanged;
  final String? confirmEqual;

  @override
  Widget build(BuildContext context) {
    final visibility = useState<bool>(true);

    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: fieldKey,
      obscureText: visibility.value,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: name,
        prefixIcon: Icon(
          Icons.lock,
          size: ConstSizes.s18,
        ),
        suffixIcon: IconButton(
          onPressed: () => visibility.value = !visibility.value,
          icon: visibility.value == true
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(
            errorText: 'This Field Required',
          ),
          FormBuilderValidators.minLength(
            8,
            errorText: 'Min length 8',
          ),
          // if (confirmEqual != null)
          //   FormBuilderValidators.equal(confirmEqual!,
          //       errorText: 'Should Equal')
        ],
      ),
      onChanged: onChanged,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
    );
  }
}

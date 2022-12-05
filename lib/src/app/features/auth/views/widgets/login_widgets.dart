part of '../pages/login_page.dart';

class _EmailFormField extends StatelessWidget {
  const _EmailFormField({
    Key? key,
    required this.emialError,
    required this.formKey,
  }) : super(key: key);

  final ValueNotifier<bool?> emialError;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'email',
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon:const Icon(
          Icons.mail_outline_outlined,
        ),
        hintText: 'Email',
        // hintStyle: context.labelSmallGx,
        suffixIcon: emialError.value == null
            ? const SizedBox()
            : emialError.value!
                ? Icon(Icons.error, color: context.colorSchemes.error)
                : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        emialError.value =
            !(formKey.currentState?.fields['email']?.validate() ?? false);
      },
      validator: FormBuilderValidators.email(
        errorText: 'Invalid Email'
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

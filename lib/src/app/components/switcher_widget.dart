import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

class SwitcherWidget extends HookWidget {
  const SwitcherWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final switchStatus = useState<bool>(true);
    void onSwitch(bool value) {
      // This is called when the user toggles the switch.
      switchStatus.value = value;
    }

    return Switch(
      // This bool value toggles the switch.
      value: switchStatus.value,
      activeColor: context.colorSchemes.primary,
      onChanged: onSwitch,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'injection_container.dart';

class InitialFile {
  InitialFile() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
      ),
    );
  }
  Future call() async {
    await InjectorFile().injectorFile();
  }
}

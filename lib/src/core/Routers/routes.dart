import 'package:flutter/material.dart';

extension NavigatorRoute on BuildContext {
  void pushName(String routeName, {arguments}) {
    Navigator.pushNamed(this, '/$routeName', arguments: arguments);
  }

  void push(Widget page) {
    Navigator.push(
      this,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
  }

  void pushAndRemoveStack(Widget page) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => page,
        ),
        (route) => false);
  }

  void replacePage(Widget page) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
  }

  void replaceName(String routeName) {
    Navigator.pushReplacementNamed(this, '/$routeName');
  }

  void pop() {
    Navigator.pop(this);
  }
}

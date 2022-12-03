import 'package:flutter/material.dart';

import '../../../../../core/enum/enums.dart';
import '../../../../components/shimmer_loading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: ShimmerLoading(
        enabled: true,
        type: PageType.withDivider,
      ),
    );
  }
}

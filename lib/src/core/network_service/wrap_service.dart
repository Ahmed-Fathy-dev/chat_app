import 'package:flutter/cupertino.dart';
import 'package:zido/src/core/network_service/response_status.dart';

class WrapService extends StatelessWidget {
  const WrapService({
    super.key,
    required this.status,
    required this.child,
    this.initialState,
    this.messageFailure,
    this.loading,
  });

  final Widget? loading;
  final ResponseStatus status;
  final Widget child;
  final Widget? initialState;
  final String? messageFailure;

  @override
  Widget build(BuildContext context) {
    return status.when(
      noInternetC: () => const Center(child: Text('No Internet Connection')),
      error: (_) => Center(child: Text(messageFailure ?? 'Exeption Error')),
      initial: () => initialState ?? const SizedBox.shrink(),
      loading: () => loading ?? const CupertinoActivityIndicator(),
      success: () => child,
    );
  }
}

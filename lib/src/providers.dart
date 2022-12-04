import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/chat/logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import 'injection/injection_container.dart';

List<BlocProvider> providers = [
  BlocProvider<UserMessagesBloc>(
    create: (context) => injector<UserMessagesBloc>(),
  ),
//   BlocProvider(
//     create: (_) => injector<CartPointesBloc>()..add(CartPointesStarted()),
//   )
//   // BlocProvider.value(
//   //   value: injector<CartMoneyBloc>()..add(CartMoneyStarted()),
//   // ),
//   // BlocProvider.value(
//   //   value: injector<CartPointesBloc>()..add(CartPointesStarted()),
//   // ),
];

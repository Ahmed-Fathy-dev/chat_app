import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/chat/logic/blocs/send_message_bloc/send_message_bloc.dart';
import 'app/features/chat/logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import 'injection/injection_container.dart';

List<BlocProvider> providers = [
  BlocProvider<UserMessagesBloc>(
    create: (context) => injector<UserMessagesBloc>(),
  ),
  // BlocProvider<SendMessageBloc>(
  //   create: (_) => injector<SendMessageBloc>(),
  // )
//   BlocProvider(
//     create: (_) => injector<_____>()..add(_____()),
//   )
];

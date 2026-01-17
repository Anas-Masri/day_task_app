import 'package:day_task_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:day_task_app/feature/auth/data/repositories/auth_repository.dart';
import 'package:day_task_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: AppKeys.globalUrl, anonKey: AppKeys.anonKey);

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: AppSize.appsize,
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           // getPages: RouteList.getPages,
//           debugShowCheckedModeBanner: false,
//           // initialRoute: AppRoutes.splashView,
//           home: SignUpPage(),
//         );
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = Supabase.instance.client;

    final remote = AuthRemoteDataSource(client: client);

    final repo = AuthRepository(remote: remote);
    final authBloc = AuthBloc(repo: repo);

    return ScreenUtilInit(
      designSize: AppSize.appsize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider<AuthBloc>.value(
          value: authBloc,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SignUpPage(),
          ),
        );
      },
    );
  }
}

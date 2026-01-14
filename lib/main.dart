import 'core/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSize.appsize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // getPages: RouteList.getPages,
          debugShowCheckedModeBanner: false,
          // initialRoute: AppRoutes.splashView,
          home: LoginPage(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:post_app/core/router/go_router.dart';
import 'package:post_app/features/public_news/presentation/bloc/public_news_bloc.dart';
import 'package:post_app/injection_container.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => OKToast(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PublicNewsBloc>(create: (context) => sl()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 6, 29, 48),
            ),
          ),
        ),
      ),
    );
  }
}

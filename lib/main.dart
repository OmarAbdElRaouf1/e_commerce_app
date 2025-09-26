import 'package:e_commerce_app/core/helper%20functions/on_generate_routes.dart';
import 'package:e_commerce_app/core/services/custom_bloc_observer.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/cubits/products_cubit/products_cubit.dart';
import 'core/repos/products_repo/product_repo.dart';
import 'core/services/getit_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Prefs.init();
  setup();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => CartCubit(),
      ),
      BlocProvider(
        create: (_) => CartItemCubit(),
      ),
      BlocProvider(
        create: (_) => ProductsCubit(getIt.get<ProductRepo>()),
      ),
    ],
    child: const FruitHub(),
  ));
}

class FruitHub extends StatefulWidget {
  const FruitHub({super.key});

  @override
  State<FruitHub> createState() => FruitHubState();
}

class FruitHubState extends State<FruitHub> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    isDark = Prefs.getBool("isDark") ?? false;
  }

  void toggleTheme(bool value) {
    setState(() => isDark = value);
    Prefs.setBool("isDark", value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.primary,
        fontFamily: 'Cairo',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: AppColors.primary,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}

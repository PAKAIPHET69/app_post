import 'package:app_post/core/util/service_locator.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/pages/add_post_page.dart';
import 'package:app_post/features/screens/home_screen.dart';
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart';
import 'package:app_post/features/signin/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/screens/profile_page.dart';
import '../../features/screens/search_page.dart';

class AppRoute {
  static const String signinRoute = "signin";
  static const String homeRoute = "home";
  static const String searchRoute = "/search";
  static const String postRoute = "/post";
  static const String profileRoute = "/profile";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signinRoute:
        return _materialRoute(
          const SignInPage(),
          providers: [
            BlocProvider<SignInCubit>(
                create: ((context) => getIt<SignInCubit>()))
          ],
        );
      case homeRoute:
        return _materialRoute(
          const HomeScreen(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()),
            ),
          ],
        );
      case searchRoute:
        return _materialRoute(
          const SearchPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()),
            ),
          ],
        );
      case postRoute:
        return _materialRoute(
          const AddPostPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()..getCurrentUser()),
            ),
          ],
        );
      case profileRoute:
        return _materialRoute(
          const ProfilePage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()..getCurrentUser()),
            ),
          ],
        );
      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }
}

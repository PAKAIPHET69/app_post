import 'package:app_post/core/util/service_locator.dart';
import 'package:app_post/core/widgets/navigationbar.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/pages/add_post_page.dart';
import 'package:app_post/features/screens/home_screen.dart';
import 'package:app_post/features/post/presentation/pages/update_post_page.dart';
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart';
import 'package:app_post/features/signin/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/screens/profile_page.dart';
import '../../features/post/presentation/pages/search_page.dart';

class AppRoute {
  static const String signinRoute = "signin";
  static const String nvbRoute = "navigationbar";
  static const String homeRoute = "home";
  static const String searchRoute = "search";
  static const String addPostRoute = "addpost";
  static const String updatePostRoute = "/updatepost";
  static const String profileRoute = "profile";

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
      case nvbRoute:
        return _materialRoute(
          const NavigationPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..getUserPosts()),
            ),
          ],
        );
      case homeRoute:
        return _materialRoute(
          const HomeScreen(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..getUserPosts()),
            ),
          ],
        );
      case updatePostRoute:
        return _materialRoute(
          const UpdetePostPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..getUserPosts()),
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
      case addPostRoute:
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
            BlocProvider<SignInCubit>(
              create: ((context) => getIt<SignInCubit>()),
            ),
          ],
        );
      default:
        return _mainRoute(const SignInPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }

  static Route<dynamic> _mainRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }
}

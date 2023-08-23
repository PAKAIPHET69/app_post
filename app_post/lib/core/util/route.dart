import 'package:app_post/core/util/service_locator.dart';
import 'package:app_post/core/widgets/navigationbar.dart';
import 'package:app_post/features/post/presentation/pages/post_card.dart';
import 'package:app_post/features/post/presentation/pages/profileuser_page.dart';
import 'package:app_post/features/post/domain/entity/post.dart';
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart';
import 'package:app_post/features/post/presentation/pages/add_post_page.dart';
import 'package:app_post/features/post/presentation/pages/comments_page.dart';
import 'package:app_post/features/post/presentation/pages/post_page.dart';
import 'package:app_post/features/post/presentation/pages/update_post_page.dart';
import 'package:app_post/features/signin/domain/entity/user.dart';
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart';
import 'package:app_post/features/signin/presentation/pages/signin_page.dart';
import 'package:app_post/features/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/post/presentation/pages/profile_page.dart';
import '../../features/search/persentitioon/cubit/search_cubit.dart';
import '../../features/search/persentitioon/pages/search_page.dart';

class AppRoute {
  static const String signinRoute = "signin";
  static const String nvbRoute = "navigationbar";
  static const String homeRoute = "home";
  static const String postcardRoute = "postcard";
  static const String searchRoute = "search";
  static const String addPostRoute = "addpost";
  static const String commentRoute = "/comment";
  static const String commentCardRoute = "/commentCard";
  static const String updatePostRoute = "/updatepost";
  static const String profileUserRoute = "/profileUser";
  static const String profileRoute = "profile";

  static const String testRoute = "testRoute";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// SignIn Page
      case signinRoute:
        return _materialRoute(
          const SignInPage(),
          providers: [
            BlocProvider<SignInCubit>(
                create: ((context) => getIt<SignInCubit>()))
          ],
        );

      /// Navigation Page
      case nvbRoute:
        return _materialRoute(
          const NavigationPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..showPostsUsers()),
            ),
            BlocProvider<SearchCubit>(
              create: ((context) => getIt<SearchCubit>()..getUser('')),
            ),
          ],
        );

      /// Home Page
      case homeRoute:
        return _materialRoute(
          const PostPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()),
            ),
          ],
        );
      case postcardRoute:
        return _materialRoute(PostCard(), providers: [
          BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..showPostsUsers()
                ..getCurrentUser()))
        ]);

      /// Update Post Page
      case updatePostRoute:
        final Post args = settings.arguments as Post;
        return _materialRoute(
          UpdetePostPage(
            getData: args,
          ),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..showPostsUsers()),
            ),
          ],
        );

      /// Search Page
      case searchRoute:
        return _materialRoute(
          const SearchPage(),
          providers: [
            BlocProvider<SearchCubit>(
              create: ((context) => getIt<SearchCubit>()..getUser('')),
            ),
          ],
        );

      /// Add Post Page
      case addPostRoute:
        return _materialRoute(
          const AddPostPage(),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()),
            ),
          ],
        );

      /// Profile Page
      case profileRoute:
        return _materialRoute(
          const ProfilePage(),
        );

      /// Post Comment
      case commentRoute:
        final String args = settings.arguments as String;
        return _materialRoute(CommentPage(getPostData: args), providers: [
          BlocProvider<PostCubit>(
            create: ((context) => getIt<PostCubit>()
              ..getCurrentUser()
              ..showComments(args)),
          ),
        ]);

      /// Profile User page
      case profileUserRoute:
        final User args = settings.arguments as User;
        return _materialRoute(
          ProfileUserPage(getDataUser: args),
          providers: [
            BlocProvider<PostCubit>(
              create: ((context) => getIt<PostCubit>()
                ..getCurrentUser()
                ..showFollows(uid: args.uid ?? '')),
            ),
          ],
        );

      case testRoute:
        return _materialRoute(TestSearch());
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

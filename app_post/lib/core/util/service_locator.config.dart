// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
<<<<<<< HEAD
import 'package:app_post/core/util/register_modules.dart' as _i46;
=======
import 'package:app_post/core/util/register_modules.dart' as _i44;
>>>>>>> parent of 8cc90f7 (save)
import 'package:app_post/features/follow/data/datasources/follow_remonte_datasources.dart'
    as _i8;
import 'package:app_post/features/follow/data/repository/follow_repository_impl.dart'
    as _i10;
import 'package:app_post/features/follow/domain/repository/follow_repository.dart'
    as _i9;
import 'package:app_post/features/follow/domain/usecases/follow_usease.dart'
    as _i11;
import 'package:app_post/features/follow/domain/usecases/get_currentuser.dart'
    as _i12;
import 'package:app_post/features/follow/presentation/cubit/follow_cubit.dart'
    as _i33;
<<<<<<< HEAD
import 'package:app_post/features/post/domain/usecases/get_currentuser.dart'
    as _i35;
import 'package:app_post/features/post/domain/usecases/get_post_comment_usecase.dart'
    as _i36;
import 'package:app_post/features/post/domain/usecases/get_posts_usecase.dart'
    as _i37;
import 'package:app_post/features/post/domain/usecases/get_view_comment.dart'
    as _i39;
import 'package:app_post/features/post/domain/usecases/likes_post.dart' as _i40;
import 'package:app_post/features/post/domain/usecases/post_usecase.dart'
    as _i20;
import 'package:app_post/features/post/domain/usecases/update_post_usecse.dart'
    as _i29;
import 'package:app_post/features/post/domain/usecases/upload_image_usecese.dart'
    as _i30;
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart'
    as _i41;
import 'package:app_post/features/search/data/datasource/search_remote_datasource.dart'
    as _i21;
import 'package:app_post/features/search/data/repository/searce_repository_impl.dart'
    as _i23;
import 'package:app_post/features/search/domain/repository/search_repository.dart'
    as _i22;
import 'package:app_post/features/search/domain/usecase/search_usecase.dart'
    as _i24;
import 'package:app_post/features/search/persentitioon/cubit/search_cubit.dart'
    as _i42;
import 'package:app_post/features/signin/data/datasources/signin_remote_datasource.dart'
    as _i26;
import 'package:app_post/features/signin/data/repository/sigin_repository_impl.dart'
=======
import 'package:app_post/features/post/data/datasources/post_remote_datasource.dart'
    as _i16;
import 'package:app_post/features/post/data/repositories/post_repository_impl.dart'
    as _i18;
import 'package:app_post/features/post/domain/repositories/post_repository.dart'
    as _i17;
import 'package:app_post/features/post/domain/usecases/comments_usecase.dart'
    as _i30;
import 'package:app_post/features/post/domain/usecases/delete_comment.dart'
    as _i31;
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart'
    as _i32;
import 'package:app_post/features/post/domain/usecases/get_currentuser.dart'
    as _i34;
import 'package:app_post/features/post/domain/usecases/get_post_comment_usecase.dart'
    as _i35;
import 'package:app_post/features/post/domain/usecases/get_posts_usecase.dart'
    as _i36;
import 'package:app_post/features/post/domain/usecases/get_view_comment.dart'
    as _i37;
import 'package:app_post/features/post/domain/usecases/likes_post.dart' as _i38;
import 'package:app_post/features/post/domain/usecases/post_usecase.dart'
    as _i19;
import 'package:app_post/features/post/domain/usecases/update_post_usecse.dart'
>>>>>>> parent of 8cc90f7 (save)
    as _i28;
import 'package:app_post/features/post/domain/usecases/upload_image_usecese.dart'
    as _i29;
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart'
    as _i39;
import 'package:app_post/features/search/data/datasource/search_remote_datasource.dart'
    as _i20;
import 'package:app_post/features/search/data/repository/searce_repository_impl.dart'
    as _i22;
import 'package:app_post/features/search/domain/repository/search_repository.dart'
    as _i21;
import 'package:app_post/features/search/domain/usecase/search_usecase.dart'
    as _i23;
import 'package:app_post/features/search/persentitioon/cubit/search_cubit.dart'
    as _i40;
import 'package:app_post/features/signin/data/datasources/signin_remote_datasource.dart'
    as _i25;
import 'package:app_post/features/signin/data/repository/sigin_repository_impl.dart'
    as _i27;
<<<<<<< HEAD
import 'package:app_post/features/signin/domain/usecases/get_token_useccase.dart'
    as _i38;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i44;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i43;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i45;
=======
import 'package:app_post/features/signin/domain/repository/signin_repository.dart'
    as _i26;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i42;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i41;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i43;
>>>>>>> parent of 8cc90f7 (save)
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;
import 'package:logger/logger.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.factory<_i3.Dio>(() => injectionModule.dio);
    gh.factory<_i4.FacebookAuth>(() => injectionModule.facebookAuth);
    gh.factory<_i5.FirebaseAuth>(() => injectionModule.auth);
    gh.factory<_i6.FirebaseFirestore>(() => injectionModule.fireStore);
<<<<<<< HEAD
    gh.factory<_i7.FirebaseMessaging>(() => injectionModule.messaging);
    gh.factory<_i8.FirebaseStorage>(() => injectionModule.storage);
    gh.lazySingleton<_i9.FollowRemoteDatasoource>(
        () => _i9.FollowDatasourceImpl(
=======
    gh.factory<_i7.FirebaseStorage>(() => injectionModule.storage);
    gh.lazySingleton<_i8.FollowRemoteDatasoource>(
        () => _i8.FollowDatasourceImpl(
>>>>>>> parent of 8cc90f7 (save)
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i9.FollowRepository>(
        () => _i10.FollowRepositoryImpl(gh<_i8.FollowRemoteDatasoource>()));
    gh.lazySingleton<_i11.FollowUsecase>(
        () => _i11.FollowUsecase(gh<_i9.FollowRepository>()));
    gh.lazySingleton<_i12.GetCurrentUser>(
        () => _i12.GetCurrentUser(gh<_i9.FollowRepository>()));
    gh.factory<_i13.GoogleSignIn>(() => injectionModule.googleSignIn);
    gh.factory<_i14.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i15.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i16.PostRemoteDatasource>(
        () => _i16.PostRemoteDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i7.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i17.PostRepository>(
        () => _i18.PostRepositoryImpl(gh<_i16.PostRemoteDatasource>()));
    gh.lazySingleton<_i19.PostUsecase>(
        () => _i19.PostUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i20.SearchRemoteDatasource>(
        () => _i20.SearchDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i7.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i21.SearchRepository>(
        () => _i22.SearchRepositoryImpl(gh<_i20.SearchRemoteDatasource>()));
    gh.lazySingleton<_i23.SearchUsecse>(
        () => _i23.SearchUsecse(gh<_i21.SearchRepository>()));
    await gh.factoryAsync<_i24.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i25.SignInDatasource>(() => _i25.SignInRemoteDatasource(
          gh<_i13.GoogleSignIn>(),
          gh<_i4.FacebookAuth>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i26.SignInRepository>(
        () => _i27.SignInRepositoryImpl(gh<_i25.SignInDatasource>()));
    gh.lazySingleton<_i28.UpdatePostUsecase>(
        () => _i28.UpdatePostUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i29.UploadImageUsecese>(
        () => _i29.UploadImageUsecese(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i30.CommentUsecase>(
        () => _i30.CommentUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i31.DeleteCommentUsecase>(
        () => _i31.DeleteCommentUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i32.DeletePostUsecase>(
        () => _i32.DeletePostUsecase(gh<_i17.PostRepository>()));
    gh.factory<_i33.FollowCubit>(() => _i33.FollowCubit(
          gh<_i11.FollowUsecase>(),
          gh<_i12.GetCurrentUser>(),
        ));
<<<<<<< HEAD
    gh.lazySingleton<_i35.GetCurrentUser>(
        () => _i35.GetCurrentUser(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i36.GetPostCommentsUsecase>(
        () => _i36.GetPostCommentsUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i37.GetPostsUsecase>(
        () => _i37.GetPostsUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i38.GetTokenUsecase>(
        () => _i38.GetTokenUsecase(gh<_i27.SignInRepository>()));
    gh.lazySingleton<_i39.GetViewCommentsUsecase>(
        () => _i39.GetViewCommentsUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i40.LikesPostUsecase>(
        () => _i40.LikesPostUsecase(gh<_i18.PostRepository>()));
    gh.factory<_i41.PostCubit>(() => _i41.PostCubit(
          gh<_i20.PostUsecase>(),
          gh<_i35.GetCurrentUser>(),
          gh<_i30.UploadImageUsecese>(),
          gh<_i37.GetPostsUsecase>(),
          gh<_i33.DeletePostUsecase>(),
          gh<_i29.UpdatePostUsecase>(),
          gh<_i31.CommentUsecase>(),
          gh<_i36.GetPostCommentsUsecase>(),
          gh<_i32.DeleteCommentUsecase>(),
          gh<_i39.GetViewCommentsUsecase>(),
          gh<_i40.LikesPostUsecase>(),
        ));
    gh.factory<_i42.SearchCubit>(
        () => _i42.SearchCubit(gh<_i24.SearchUsecse>()));
    gh.lazySingleton<_i43.SigInGoogleUsecase>(
        () => _i43.SigInGoogleUsecase(gh<_i27.SignInRepository>()));
    gh.lazySingleton<_i44.SigInfacebookUsecase>(
        () => _i44.SigInfacebookUsecase(gh<_i27.SignInRepository>()));
    gh.factory<_i45.SignInCubit>(() => _i45.SignInCubit(
          gh<_i43.SigInGoogleUsecase>(),
          gh<_i44.SigInfacebookUsecase>(),
          gh<_i38.GetTokenUsecase>(),
=======
    gh.lazySingleton<_i34.GetCurrentUser>(
        () => _i34.GetCurrentUser(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i35.GetPostCommentsUsecase>(
        () => _i35.GetPostCommentsUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i36.GetPostsUsecase>(
        () => _i36.GetPostsUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i37.GetViewCommentsUsecase>(
        () => _i37.GetViewCommentsUsecase(gh<_i17.PostRepository>()));
    gh.lazySingleton<_i38.LikesPostUsecase>(
        () => _i38.LikesPostUsecase(gh<_i17.PostRepository>()));
    gh.factory<_i39.PostCubit>(() => _i39.PostCubit(
          gh<_i19.PostUsecase>(),
          gh<_i34.GetCurrentUser>(),
          gh<_i29.UploadImageUsecese>(),
          gh<_i36.GetPostsUsecase>(),
          gh<_i32.DeletePostUsecase>(),
          gh<_i28.UpdatePostUsecase>(),
          gh<_i30.CommentUsecase>(),
          gh<_i35.GetPostCommentsUsecase>(),
          gh<_i31.DeleteCommentUsecase>(),
          gh<_i37.GetViewCommentsUsecase>(),
          gh<_i38.LikesPostUsecase>(),
        ));
    gh.factory<_i40.SearchCubit>(
        () => _i40.SearchCubit(gh<_i23.SearchUsecse>()));
    gh.lazySingleton<_i41.SigInGoogleUsecase>(
        () => _i41.SigInGoogleUsecase(gh<_i26.SignInRepository>()));
    gh.lazySingleton<_i42.SigInfacebookUsecase>(
        () => _i42.SigInfacebookUsecase(gh<_i26.SignInRepository>()));
    gh.factory<_i43.SignInCubit>(() => _i43.SignInCubit(
          gh<_i41.SigInGoogleUsecase>(),
          gh<_i42.SigInfacebookUsecase>(),
>>>>>>> parent of 8cc90f7 (save)
        ));
    return this;
  }
}

<<<<<<< HEAD
class _$InjectionModule extends _i46.InjectionModule {}
=======
class _$InjectionModule extends _i44.InjectionModule {}
>>>>>>> parent of 8cc90f7 (save)

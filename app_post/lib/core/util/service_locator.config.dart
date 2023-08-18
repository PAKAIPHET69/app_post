// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_post/core/util/register_modules.dart' as _i46;
import 'package:app_post/features/follow/data/datasources/follow_remonte_datasources.dart'
    as _i9;
import 'package:app_post/features/follow/data/repository/follow_repository_impl.dart'
    as _i11;
import 'package:app_post/features/follow/domain/repository/follow_repository.dart'
    as _i10;
import 'package:app_post/features/follow/domain/usecases/follow_usease.dart'
    as _i12;
import 'package:app_post/features/follow/domain/usecases/get_currentuser.dart'
    as _i13;
import 'package:app_post/features/follow/presentation/cubit/follow_cubit.dart'
    as _i34;
import 'package:app_post/features/post/data/datasources/post_remote_datasource.dart'
    as _i17;
import 'package:app_post/features/post/data/repositories/post_repository_impl.dart'
    as _i19;
import 'package:app_post/features/post/domain/repositories/post_repository.dart'
    as _i18;
import 'package:app_post/features/post/domain/usecases/comments_usecase.dart'
    as _i31;
import 'package:app_post/features/post/domain/usecases/delete_comment.dart'
    as _i32;
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart'
    as _i33;
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
    as _i28;
import 'package:app_post/features/signin/domain/repository/signin_repository.dart'
    as _i27;
import 'package:app_post/features/signin/domain/usecases/get_token_useccase.dart'
    as _i38;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i44;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i43;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i45;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;
import 'package:logger/logger.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i25;

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
    gh.factory<_i7.FirebaseMessaging>(() => injectionModule.messaging);
    gh.factory<_i8.FirebaseStorage>(() => injectionModule.storage);
    gh.lazySingleton<_i9.FollowRemoteDatasoource>(
        () => _i9.FollowDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
            ));
    gh.lazySingleton<_i10.FollowRepository>(
        () => _i11.FollowRepositoryImpl(gh<_i9.FollowRemoteDatasoource>()));
    gh.lazySingleton<_i12.FollowUsecase>(
        () => _i12.FollowUsecase(gh<_i10.FollowRepository>()));
    gh.lazySingleton<_i13.GetCurrentUser>(
        () => _i13.GetCurrentUser(gh<_i10.FollowRepository>()));
    gh.factory<_i14.GoogleSignIn>(() => injectionModule.googleSignIn);
    gh.factory<_i15.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i16.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i17.PostRemoteDatasource>(
        () => _i17.PostRemoteDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i18.PostRepository>(
        () => _i19.PostRepositoryImpl(gh<_i17.PostRemoteDatasource>()));
    gh.lazySingleton<_i20.PostUsecase>(
        () => _i20.PostUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i21.SearchRemoteDatasource>(
        () => _i21.SearchDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i22.SearchRepository>(
        () => _i23.SearchRepositoryImpl(gh<_i21.SearchRemoteDatasource>()));
    gh.lazySingleton<_i24.SearchUsecse>(
        () => _i24.SearchUsecse(gh<_i22.SearchRepository>()));
    await gh.factoryAsync<_i25.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i26.SignInDatasource>(() => _i26.SignInRemoteDatasource(
          gh<_i14.GoogleSignIn>(),
          gh<_i4.FacebookAuth>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
          gh<_i7.FirebaseMessaging>(),
        ));
    gh.lazySingleton<_i27.SignInRepository>(
        () => _i28.SignInRepositoryImpl(gh<_i26.SignInDatasource>()));
    gh.lazySingleton<_i29.UpdatePostUsecase>(
        () => _i29.UpdatePostUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i30.UploadImageUsecese>(
        () => _i30.UploadImageUsecese(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i31.CommentUsecase>(
        () => _i31.CommentUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i32.DeleteCommentUsecase>(
        () => _i32.DeleteCommentUsecase(gh<_i18.PostRepository>()));
    gh.lazySingleton<_i33.DeletePostUsecase>(
        () => _i33.DeletePostUsecase(gh<_i18.PostRepository>()));
    gh.factory<_i34.FollowCubit>(() => _i34.FollowCubit(
          gh<_i12.FollowUsecase>(),
          gh<_i13.GetCurrentUser>(),
        ));
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
        ));
    return this;
  }
}

class _$InjectionModule extends _i46.InjectionModule {}

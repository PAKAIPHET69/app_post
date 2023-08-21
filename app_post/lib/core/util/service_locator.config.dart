// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_post/core/util/register_modules.dart' as _i42;
import 'package:app_post/features/post/data/datasources/post_remote_datasource.dart'
    as _i12;
import 'package:app_post/features/post/data/repositories/post_repository_impl.dart'
    as _i14;
import 'package:app_post/features/post/domain/repositories/post_repository.dart'
    as _i13;
import 'package:app_post/features/post/domain/usecases/comments_usecase.dart'
    as _i26;
import 'package:app_post/features/post/domain/usecases/delete_comment.dart'
    as _i27;
import 'package:app_post/features/post/domain/usecases/delete_post_usecse.dart'
    as _i28;
import 'package:app_post/features/post/domain/usecases/follow_usecse.dart'
    as _i29;
import 'package:app_post/features/post/domain/usecases/get_currentuser.dart'
    as _i30;
import 'package:app_post/features/post/domain/usecases/get_follow.dart' as _i31;
import 'package:app_post/features/post/domain/usecases/get_post_comment_usecase.dart'
    as _i32;
import 'package:app_post/features/post/domain/usecases/get_posts_usecase.dart'
    as _i33;
import 'package:app_post/features/post/domain/usecases/get_view_comment.dart'
    as _i35;
import 'package:app_post/features/post/domain/usecases/likes_post.dart' as _i36;
import 'package:app_post/features/post/domain/usecases/post_usecase.dart'
    as _i15;
import 'package:app_post/features/post/domain/usecases/update_post_usecse.dart'
    as _i24;
import 'package:app_post/features/post/domain/usecases/upload_image_usecese.dart'
    as _i25;
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart'
    as _i37;
import 'package:app_post/features/search/data/datasource/search_remote_datasource.dart'
    as _i16;
import 'package:app_post/features/search/data/repository/searce_repository_impl.dart'
    as _i18;
import 'package:app_post/features/search/domain/repository/search_repository.dart'
    as _i17;
import 'package:app_post/features/search/domain/usecase/search_usecase.dart'
    as _i19;
import 'package:app_post/features/search/persentitioon/cubit/search_cubit.dart'
    as _i38;
import 'package:app_post/features/signin/data/datasources/signin_remote_datasource.dart'
    as _i21;
import 'package:app_post/features/signin/data/repository/sigin_repository_impl.dart'
    as _i23;
import 'package:app_post/features/signin/domain/repository/signin_repository.dart'
    as _i22;
import 'package:app_post/features/signin/domain/usecases/get_token_useccase.dart'
    as _i34;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i40;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i39;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i41;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:logger/logger.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

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
    gh.factory<_i9.GoogleSignIn>(() => injectionModule.googleSignIn);
    gh.factory<_i10.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i11.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i12.PostRemoteDatasource>(
        () => _i12.PostRemoteDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i13.PostRepository>(
        () => _i14.PostRepositoryImpl(gh<_i12.PostRemoteDatasource>()));
    gh.lazySingleton<_i15.PostUsecase>(
        () => _i15.PostUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i16.SearchRemoteDatasource>(
        () => _i16.SearchDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i17.SearchRepository>(
        () => _i18.SearchRepositoryImpl(gh<_i16.SearchRemoteDatasource>()));
    gh.lazySingleton<_i19.SearchUsecse>(
        () => _i19.SearchUsecse(gh<_i17.SearchRepository>()));
    await gh.factoryAsync<_i20.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i21.SignInDatasource>(() => _i21.SignInRemoteDatasource(
          gh<_i9.GoogleSignIn>(),
          gh<_i4.FacebookAuth>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
          gh<_i7.FirebaseMessaging>(),
        ));
    gh.lazySingleton<_i22.SignInRepository>(
        () => _i23.SignInRepositoryImpl(gh<_i21.SignInDatasource>()));
    gh.lazySingleton<_i24.UpdatePostUsecase>(
        () => _i24.UpdatePostUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i25.UploadImageUsecese>(
        () => _i25.UploadImageUsecese(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i26.CommentUsecase>(
        () => _i26.CommentUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i27.DeleteCommentUsecase>(
        () => _i27.DeleteCommentUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i28.DeletePostUsecase>(
        () => _i28.DeletePostUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i29.FollowUsecase>(
        () => _i29.FollowUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i30.GetCurrentUser>(
        () => _i30.GetCurrentUser(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i31.GetFollowUsecase>(
        () => _i31.GetFollowUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i32.GetPostCommentsUsecase>(
        () => _i32.GetPostCommentsUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i33.GetPostsUsecase>(
        () => _i33.GetPostsUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i34.GetTokenUsecase>(
        () => _i34.GetTokenUsecase(gh<_i22.SignInRepository>()));
    gh.lazySingleton<_i35.GetViewCommentsUsecase>(
        () => _i35.GetViewCommentsUsecase(gh<_i13.PostRepository>()));
    gh.lazySingleton<_i36.LikesPostUsecase>(
        () => _i36.LikesPostUsecase(gh<_i13.PostRepository>()));
    gh.factory<_i37.PostCubit>(() => _i37.PostCubit(
          gh<_i15.PostUsecase>(),
          gh<_i30.GetCurrentUser>(),
          gh<_i25.UploadImageUsecese>(),
          gh<_i33.GetPostsUsecase>(),
          gh<_i28.DeletePostUsecase>(),
          gh<_i24.UpdatePostUsecase>(),
          gh<_i26.CommentUsecase>(),
          gh<_i32.GetPostCommentsUsecase>(),
          gh<_i27.DeleteCommentUsecase>(),
          gh<_i35.GetViewCommentsUsecase>(),
          gh<_i36.LikesPostUsecase>(),
          gh<_i31.GetFollowUsecase>(),
          gh<_i29.FollowUsecase>(),
        ));
    gh.factory<_i38.SearchCubit>(
        () => _i38.SearchCubit(gh<_i19.SearchUsecse>()));
    gh.lazySingleton<_i39.SigInGoogleUsecase>(
        () => _i39.SigInGoogleUsecase(gh<_i22.SignInRepository>()));
    gh.lazySingleton<_i40.SigInfacebookUsecase>(
        () => _i40.SigInfacebookUsecase(gh<_i22.SignInRepository>()));
    gh.factory<_i41.SignInCubit>(() => _i41.SignInCubit(
          gh<_i39.SigInGoogleUsecase>(),
          gh<_i40.SigInfacebookUsecase>(),
          gh<_i34.GetTokenUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i42.InjectionModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_post/core/util/register_modules.dart' as _i44;
import 'package:app_post/features/post/data/datasources/comment_remote_dayasource.dart'
    as _i22;
import 'package:app_post/features/post/data/datasources/follow_remote_datesource.dart'
    as _i9;
import 'package:app_post/features/post/data/datasources/post_remote_datasource.dart'
    as _i13;
import 'package:app_post/features/post/data/repositories/repository_impl.dart'
    as _i25;
import 'package:app_post/features/post/domain/repositories/repository.dart'
    as _i24;
import 'package:app_post/features/post/domain/usecases/comment_usecase/comments_usecase.dart'
    as _i36;
import 'package:app_post/features/post/domain/usecases/comment_usecase/count_comment_usecase.dart'
    as _i37;
import 'package:app_post/features/post/domain/usecases/comment_usecase/delete_comment_usecase.dart'
    as _i38;
import 'package:app_post/features/post/domain/usecases/comment_usecase/show_comment_usecase.dart'
    as _i28;
import 'package:app_post/features/post/domain/usecases/follow_usecse/follow_usecse.dart'
    as _i40;
import 'package:app_post/features/post/domain/usecases/follow_usecse/show_follow_usecase.dart'
    as _i29;
import 'package:app_post/features/post/domain/usecases/get_currentuser.dart'
    as _i41;
import 'package:app_post/features/post/domain/usecases/likes_post.dart' as _i42;
import 'package:app_post/features/post/domain/usecases/posts_usecase/delete_post_usecse.dart'
    as _i39;
import 'package:app_post/features/post/domain/usecases/posts_usecase/save_post_usecase.dart'
    as _i26;
import 'package:app_post/features/post/domain/usecases/posts_usecase/show_posts_usecase.dart'
    as _i30;
import 'package:app_post/features/post/domain/usecases/posts_usecase/update_post_usecse.dart'
    as _i34;
import 'package:app_post/features/post/domain/usecases/upload_image_usecese.dart'
    as _i35;
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart'
    as _i43;
import 'package:app_post/features/search/data/datasource/search_remote_datasource.dart'
    as _i14;
import 'package:app_post/features/search/data/repository/searce_repository_impl.dart'
    as _i16;
import 'package:app_post/features/search/domain/repository/search_repository.dart'
    as _i15;
import 'package:app_post/features/search/domain/usecase/search_usecase.dart'
    as _i17;
import 'package:app_post/features/search/persentitioon/cubit/search_cubit.dart'
    as _i27;
import 'package:app_post/features/signin/data/datasources/signin_remote_datasource.dart'
    as _i19;
import 'package:app_post/features/signin/data/repository/sigin_repository_impl.dart'
    as _i21;
import 'package:app_post/features/signin/domain/repository/signin_repository.dart'
    as _i20;
import 'package:app_post/features/signin/domain/usecases/get_token_useccase.dart'
    as _i23;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i32;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i31;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i33;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;
import 'package:logger/logger.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

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
    gh.lazySingleton<_i9.FollowRemotDataSource>(
        () => _i9.FollowRemotDataSourceImpl(gh<_i6.FirebaseFirestore>()));
    gh.factory<_i10.GoogleSignIn>(() => injectionModule.googleSignIn);
    gh.factory<_i11.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i12.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i13.PostRemoteDatasource>(
        () => _i13.PostRemoteDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i14.SearchRemoteDatasource>(
        () => _i14.SearchDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i8.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i15.SearchRepository>(
        () => _i16.SearchRepositoryImpl(gh<_i14.SearchRemoteDatasource>()));
    gh.lazySingleton<_i17.SearchUsecse>(
        () => _i17.SearchUsecse(gh<_i15.SearchRepository>()));
    await gh.factoryAsync<_i18.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i19.SignInDatasource>(() => _i19.SignInRemoteDatasource(
          gh<_i10.GoogleSignIn>(),
          gh<_i4.FacebookAuth>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
          gh<_i7.FirebaseMessaging>(),
        ));
    gh.lazySingleton<_i20.SignInRepository>(
        () => _i21.SignInRepositoryImpl(gh<_i19.SignInDatasource>()));
    gh.lazySingleton<_i22.CommentRemoteDataSoure>(
        () => _i22.CommentRemoteDataSoureImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i23.GetTokenUsecase>(
        () => _i23.GetTokenUsecase(gh<_i20.SignInRepository>()));
    gh.lazySingleton<_i24.Repository>(() => _i25.RepositoryImpl(
          gh<_i13.PostRemoteDatasource>(),
          gh<_i22.CommentRemoteDataSoure>(),
          gh<_i9.FollowRemotDataSource>(),
        ));
    gh.lazySingleton<_i26.SavePostUsecase>(
        () => _i26.SavePostUsecase(gh<_i24.Repository>()));
    gh.factory<_i27.SearchCubit>(
        () => _i27.SearchCubit(gh<_i17.SearchUsecse>()));
    gh.lazySingleton<_i28.ShowCommentsUsecase>(
        () => _i28.ShowCommentsUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i29.ShowFollowUsecase>(
        () => _i29.ShowFollowUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i30.ShowPostsUsecase>(
        () => _i30.ShowPostsUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i31.SigInGoogleUsecase>(
        () => _i31.SigInGoogleUsecase(gh<_i20.SignInRepository>()));
    gh.lazySingleton<_i32.SigInfacebookUsecase>(
        () => _i32.SigInfacebookUsecase(gh<_i20.SignInRepository>()));
    gh.factory<_i33.SignInCubit>(() => _i33.SignInCubit(
          gh<_i31.SigInGoogleUsecase>(),
          gh<_i32.SigInfacebookUsecase>(),
          gh<_i23.GetTokenUsecase>(),
        ));
    gh.lazySingleton<_i34.UpdatePostUsecase>(
        () => _i34.UpdatePostUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i35.UploadImageUsecese>(
        () => _i35.UploadImageUsecese(gh<_i24.Repository>()));
    gh.lazySingleton<_i36.CommentUsecase>(
        () => _i36.CommentUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i37.CountCommentUsecase>(
        () => _i37.CountCommentUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i38.DeleteCommentUsecase>(
        () => _i38.DeleteCommentUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i39.DeletePostUsecase>(
        () => _i39.DeletePostUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i40.FollowUsecase>(
        () => _i40.FollowUsecase(gh<_i24.Repository>()));
    gh.lazySingleton<_i41.GetCurrentUser>(
        () => _i41.GetCurrentUser(gh<_i24.Repository>()));
    gh.lazySingleton<_i42.LikesPostUsecase>(
        () => _i42.LikesPostUsecase(gh<_i24.Repository>()));
    gh.factory<_i43.PostCubit>(() => _i43.PostCubit(
          gh<_i26.SavePostUsecase>(),
          gh<_i41.GetCurrentUser>(),
          gh<_i35.UploadImageUsecese>(),
          gh<_i30.ShowPostsUsecase>(),
          gh<_i39.DeletePostUsecase>(),
          gh<_i34.UpdatePostUsecase>(),
          gh<_i36.CommentUsecase>(),
          gh<_i28.ShowCommentsUsecase>(),
          gh<_i38.DeleteCommentUsecase>(),
          gh<_i37.CountCommentUsecase>(),
          gh<_i42.LikesPostUsecase>(),
          gh<_i29.ShowFollowUsecase>(),
          gh<_i40.FollowUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i44.InjectionModule {}

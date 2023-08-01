// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_post/core/util/register_modules.dart' as _i26;
import 'package:app_post/features/post/data/datasources/post_remote_datasource.dart'
    as _i11;
import 'package:app_post/features/post/data/repositories/post_repository_impl.dart'
    as _i13;
import 'package:app_post/features/post/domain/repositories/post_repository.dart'
    as _i12;
import 'package:app_post/features/post/domain/usecases/fetch_posts_usecase.dart'
    as _i21;
import 'package:app_post/features/post/domain/usecases/get_currentuser.dart'
    as _i20;
import 'package:app_post/features/post/domain/usecases/post_usecase.dart'
    as _i14;
import 'package:app_post/features/post/domain/usecases/upload_image_usecese.dart'
    as _i19;
import 'package:app_post/features/post/presentation/cubit/post_cubit.dart'
    as _i22;
import 'package:app_post/features/signin/data/datasources/signin_remote_datasource.dart'
    as _i16;
import 'package:app_post/features/signin/data/repository/sigin_repository_impl.dart'
    as _i18;
import 'package:app_post/features/signin/domain/repository/signin_repository.dart'
    as _i17;
import 'package:app_post/features/signin/domain/usecases/sigin_facebook_usecase.dart'
    as _i24;
import 'package:app_post/features/signin/domain/usecases/sigin_google_usecase.dart'
    as _i23;
import 'package:app_post/features/signin/presentation/cubit/singin_cubit.dart'
    as _i25;
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:logger/logger.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

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
    gh.factory<_i7.FirebaseStorage>(() => injectionModule.storage);
    gh.factory<_i8.GoogleSignIn>(() => injectionModule.googleSignIn);
    gh.factory<_i9.InternetConnectionChecker>(
        () => injectionModule.internetConnectionChecker);
    gh.factory<_i10.Logger>(() => injectionModule.logger);
    gh.lazySingleton<_i11.PostRemoteDatasource>(
        () => _i11.PostRemoteDatasourceImpl(
              gh<_i6.FirebaseFirestore>(),
              gh<_i5.FirebaseAuth>(),
              gh<_i7.FirebaseStorage>(),
            ));
    gh.lazySingleton<_i12.PostRepository>(
        () => _i13.PostRepositoryImpl(gh<_i11.PostRemoteDatasource>()));
    gh.lazySingleton<_i14.PostUsecase>(
        () => _i14.PostUsecase(gh<_i12.PostRepository>()));
    await gh.factoryAsync<_i15.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i16.SignInDatasource>(() => _i16.SignInRemoteDatasource(
          gh<_i8.GoogleSignIn>(),
          gh<_i4.FacebookAuth>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i17.SignInRepository>(
        () => _i18.SignInRepositoryImpl(gh<_i16.SignInDatasource>()));
    gh.lazySingleton<_i19.UploadImageUsecese>(
        () => _i19.UploadImageUsecese(gh<_i12.PostRepository>()));
    gh.lazySingleton<_i20.GetCurrentUser>(
        () => _i20.GetCurrentUser(gh<_i12.PostRepository>()));
    gh.lazySingleton<_i21.GetPostsUsecase>(
        () => _i21.GetPostsUsecase(gh<_i12.PostRepository>()));
    gh.factory<_i22.PostCubit>(() => _i22.PostCubit(
          gh<_i14.PostUsecase>(),
          gh<_i20.GetCurrentUser>(),
          gh<_i19.UploadImageUsecese>(),
          gh<_i21.GetPostsUsecase>(),
        ));
    gh.lazySingleton<_i23.SigInGoogleUsecase>(
        () => _i23.SigInGoogleUsecase(gh<_i17.SignInRepository>()));
    gh.lazySingleton<_i24.SigInfacebookUsecase>(
        () => _i24.SigInfacebookUsecase(gh<_i17.SignInRepository>()));
    gh.factory<_i25.SignInCubit>(() => _i25.SignInCubit(
          gh<_i23.SigInGoogleUsecase>(),
          gh<_i24.SigInfacebookUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i26.InjectionModule {}

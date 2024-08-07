// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => AuthDatasource(), name: 'DatasourceFactory')
      ..registerFactory(
          (c) => AuthRepository(c.resolve<AuthDatasource>('DatasourceFactory')),
          name: 'AuthRepository')
      ..registerFactory(
          (c) => AuthUseCase(c.resolve<AuthRepository>('AuthRepository')),
          name: 'AuthUseCase')
      ..registerFactory((c) => AuthBloc(c.resolve<AuthUseCase>('AuthUseCase')))
      ..registerFactory((c) => HttpClient(), name: 'HttpClient')
      ..registerFactory(
          (c) => ArticleDatasource(c.resolve<HttpClient>('HttpClient')),
          name: 'ArticleDatasource')
      ..registerFactory(
          (c) => Articlerepository(
              c.resolve<ArticleDatasource>('ArticleDatasource')),
          name: 'Articlerepository')
      ..registerFactory(
          (c) => DashboardUseCase(
              c.resolve<Articlerepository>('Articlerepository')),
          name: 'DashboardUseCase')
      ..registerFactory((c) =>
          DashBoardBloc(c.resolve<DashboardUseCase>('DashboardUseCase')));
  }
}

// Package imports:
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:hibank/data/datasource/api/article_datasource.dart';
import 'package:hibank/data/datasource/firebase/auth_datasource.dart';
import 'package:hibank/data/repository/article_repository.dart';
import 'package:hibank/data/repository/auth_repository.dart';
import 'package:hibank/domain/usecase/auth_usecase.dart';
import 'package:hibank/domain/usecase/dashboard_usecase.dart';
import 'package:hibank/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:hibank/presentation/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:hibank/util/http/http_client.dart';

part 'injector.g.dart';

abstract class Injector {
  // Auth
  @Register.factory(AuthDatasource, name: 'DatasourceFactory')
  @Register.factory(
    AuthRepository,
    name: 'AuthRepository',
    resolvers: {AuthDatasource: 'DatasourceFactory'},
  )
  @Register.factory(AuthUseCase,
      name: 'AuthUseCase', resolvers: {AuthRepository: 'AuthRepository'})
  @Register.factory(AuthBloc, resolvers: {AuthUseCase: 'AuthUseCase'})

  // Dashboard
  @Register.factory(HttpClient, name: 'HttpClient')
  @Register.factory(ArticleDatasource,
      name: 'ArticleDatasource', resolvers: {HttpClient: 'HttpClient'})
  @Register.factory(Articlerepository,
      name: 'Articlerepository',
      resolvers: {ArticleDatasource: 'ArticleDatasource'})
  @Register.factory(DashboardUseCase,
      name: 'DashboardUseCase',
      resolvers: {Articlerepository: 'Articlerepository'})
  @Register.factory(DashBoardBloc,
      resolvers: {DashboardUseCase: 'DashboardUseCase'})
  void configure();
}

class KiwiContainerSetUp {
  static void setup() {
    var injector = _$Injector();
    injector.configure();
  }
}

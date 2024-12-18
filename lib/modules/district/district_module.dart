import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/core/shared/domain/services/http_service.dart';
import 'package:monetizze_app/modules/district/domain/repositories/district_repository.dart';
import 'package:monetizze_app/modules/district/domain/usecases/get_districts_usecase.dart';
import 'package:monetizze_app/modules/district/infra/datasources/remote/district_remote_datasource_imp.dart';
import 'package:monetizze_app/modules/district/infra/repositories/district_repository_imp.dart';
import 'package:monetizze_app/modules/district/presentation/controller/blocs/district_bloc.dart';
import 'package:monetizze_app/modules/district/presentation/ui/pages/district_details_page.dart';
import 'package:monetizze_app/modules/district/presentation/ui/pages/district_list_page.dart';

import '../app_module.dart';
import 'infra/datasources/district_datasource.dart';

class DistrictModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.add<DistrictDataSource>(
      () => DistrictRemoteDataSourceImp(i<HttpService>()),
    );

    i.add<DistrictRepository>(
      () => DistrictRepositoryImp(i<DistrictDataSource>()),
    );
    i.add<GetDistrictsUseCase>(
      () => GetDistrictsUseCaseImp(i<DistrictRepository>()),
    );

    i.add<DistrictBloc>(
      () => DistrictBloc(i<GetDistrictsUseCase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const DistrictListPage());
    r.child(
      '/details',
      child: (_) => DistrictDetailsPage(district: Modular.args.data),
    );
  }
}

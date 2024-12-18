import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/core/utils/app_routes/districts_module_routes.dart';
import 'package:monetizze_app/modules/district/district_module.dart';

import '../core/shared/domain/services/http_service.dart';
import '../core/shared/infra/services/dio_http_service_imp.dart';
import '../core/utils/app_routes/coordinator_module_routes.dart';
import 'coordinator/coordinator_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.add<HttpService>(
      () => DioHttpServiceImp(),
    );
  }

  @override
  void routes(RouteManager r) {
    r.module(CoordinatorModuleRoutes.moduleName, module: CoordinatorModule());
    r.module(DistrictModuleRoutes.moduleName, module: DistrictModule());
  }
}

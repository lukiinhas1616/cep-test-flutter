import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/modules/coordinator/presentation/controller/blocs/coordinator_bloc.dart';

import 'domain/repositories/coordinator_repository.dart';
import 'domain/usecases/get_initial_route_usecase.dart';
import 'infra/repositories/coordinator_repository_imp.dart';
import 'presentation/ui/pages/splash_page.dart';

class CoordinatorModule extends Module {
  @override
  void binds(Injector i) {
    i.add<CoordinatorRepository>(
      () => const CoordinatorRepositoryImp(),
    );

    i.add<GetInitialRouteUseCase>(
      () => GetInitialRouteUseCaseImp(i<CoordinatorRepository>()),
    );

    i.add<CoordinatorBloc>(
      () => CoordinatorBloc(i<GetInitialRouteUseCase>()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
  }
}

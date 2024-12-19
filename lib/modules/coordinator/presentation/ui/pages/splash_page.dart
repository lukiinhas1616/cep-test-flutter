import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/core/utils/app_routes/districts_module_routes.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../controller/blocs/coordinator_bloc.dart';
import '../../controller/events/get_initial_route_event.dart';
import '../../controller/states/successfully_got_initial_route_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final coordinatorBloc = Modular.get<CoordinatorBloc>();

  @override
  void initState() {
    super.initState();
    coordinatorBloc.add(const GetInitialRouteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CoordinatorBloc, AppState>(
      bloc: coordinatorBloc,
      listener: (context, state) async {
        if (state is SuccessfullyGotInitialRouteState) {
          await Future.delayed(const Duration(seconds: 1));
          Modular.to.navigate(DistrictModuleRoutes.initialRoute);
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/icon/logo_without_bg.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                Text(
                  'Carregando informações...',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

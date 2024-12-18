import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/core/shared/presentation/controller/states/idle_state.dart';
import 'package:monetizze_app/core/utils/app_routes/districts_module_routes.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/redirecting_to_details_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

import '../../../../../core/shared/presentation/ui/widgets/appbar_widget.dart';
import '../../controller/blocs/district_bloc.dart';
import '../../controller/events/fetch_districts_event.dart';
import '../../controller/events/redirect_to_details_event.dart';
import '../../controller/states/error_on_get_districts_state.dart';
import '../../controller/states/fetching_districts_state.dart';
import '../widgets/district_card_widget.dart';

class DistrictsPage extends StatefulWidget {
  const DistrictsPage({super.key});

  @override
  State<DistrictsPage> createState() => _DistrictsPageState();
}

class _DistrictsPageState extends State<DistrictsPage> {
  final bloc = Modular.get<DistrictBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(const GetDistrictsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbarWidget(
        title: 'Listagem de distritos',
        refreshCallback: () {
          bloc.add(const GetDistrictsEvent());
        },
      ),
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) {
          if (state is IdleState) {
            bloc.add(const GetDistrictsEvent());
          }

          if (state is ErrorOnGetDistrictsState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }

          if (state is RedirectingToDetailsState) {
            Modular.to.pushNamed(
              DistrictModuleRoutes.districtDetails,
              arguments: state.district,
            );
          }
        },
        builder: (context, state) {
          if (state is FetchingDistrictsState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (state is SuccessfullyGotDistrictsState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.districts.length,
                itemBuilder: (context, index) {
                  final district = state.districts[index];
                  return DistrictCardWidget(
                    district: district,
                    onCardTapCallback: () {
                      bloc.add(RedirectToDetailsEvent(district: district));
                    },
                  );
                },
              ),
            );
          }
          return const Center(child: Text('Ocorreu um erro, tente novamente'));
        },
      ),
    );
  }
}

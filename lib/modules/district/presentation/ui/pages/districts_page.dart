import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/core/utils/app_routes/districts_module_routes.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/many_requests_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/redirecting_to_details_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

import '../../../../../core/shared/presentation/ui/widgets/appbar_widget.dart';
import '../../../../../core/utils/constants/style_constants.dart';
import '../../../../../core/utils/debouncer/debouncer.dart';
import '../../controller/blocs/district_bloc.dart';
import '../../controller/events/fetch_districts_event.dart';
import '../../controller/events/get_districts_by_name_event.dart';
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
  final _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 500),
  );

  @override
  void initState() {
    super.initState();
    bloc.add(const GetDistrictsEvent());
  }

  void _onSearchChanged() {
    _debouncer.run(() {
      bloc.add(GetDistrictsByNameEvent(
        text: _searchController.text.toLowerCase(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbarWidget(
        title: 'Listagem de distritos',
        refreshCallback: () {
          _searchController.clear();
          bloc.add(const GetDistrictsEvent());
        },
      ),
      body: BlocConsumer(
        bloc: bloc,
        listener: (context, state) {
          if (state is ErrorOnGetDistrictsState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is RedirectingToDetailsState) {
            _searchController.clear();
            Modular.to.pushNamed(
              DistrictModuleRoutes.districtDetails,
              arguments: state.district,
            );
          }

          if (state is ManyRequestsState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
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
              padding: const EdgeInsets.all(StyleConstants.kScreenPadding),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (_) => _onSearchChanged(),
                    decoration: InputDecoration(
                      hintText: 'Pesquisar municipio',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.districts.length,
                      itemBuilder: (context, index) {
                        final district = state.districts[index];
                        return DistrictCardWidget(
                          district: district,
                          onCardTapCallback: () {
                            bloc.add(
                                RedirectToDetailsEvent(district: district));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is RedirectingToDetailsState) return const SizedBox();
          return const Center(child: Text('Ocorreu um erro, tente novamente'));
        },
      ),
    );
  }
}

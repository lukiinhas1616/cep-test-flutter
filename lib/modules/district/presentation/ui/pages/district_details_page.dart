import 'package:flutter/material.dart';
import 'package:monetizze_app/core/shared/presentation/ui/widgets/appbar_widget.dart';

import '../../../../../core/shared/presentation/ui/widgets/vertical_text_with_subtext.dart';
import '../../../../../core/utils/constants/style_constants.dart';
import '../../../domain/entities/district_entity.dart';

class DistrictDetailsPage extends StatelessWidget {
  final DistrictEntity district;

  const DistrictDetailsPage({super.key, required this.district});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbarWidget(
        title: '${district.municipalityName} - ${district.stateAcronym}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(StyleConstants.kScreenPadding),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(StyleConstants.kScreenPaddingHalf),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalTextWithSubtext(
                  label: 'Município:',
                  value: district.municipalityName,
                ),
                VerticalTextWithSubtext(
                  label: 'Estado:',
                  value: district.stateName,
                ),
                VerticalTextWithSubtext(
                  label: 'Sigla do Estado:',
                  value: district.stateAcronym,
                ),
                VerticalTextWithSubtext(
                  label: 'ID do Município:',
                  value: district.municipalityId.toString(),
                ),
                VerticalTextWithSubtext(
                  label: 'Microrregião:',
                  value: district.microRegionName,
                ),
                VerticalTextWithSubtext(
                  label: 'Mesorregião:',
                  value: district.mesoRegionName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

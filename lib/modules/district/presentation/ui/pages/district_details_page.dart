import 'package:flutter/material.dart';
import 'package:monetizze_app/core/shared/presentation/ui/widgets/appbar_widget.dart';

import '../../../../../core/shared/presentation/ui/widgets/horizontal_text_with_subtext.dart';
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
            margin: const EdgeInsets.all(StyleConstants.kScreenPaddingHalf),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HorizontalTextWithSubtext(
                  label: 'Município:',
                  value: district.municipalityName,
                ),
                HorizontalTextWithSubtext(
                  label: 'Estado:',
                  value: district.stateName,
                ),
                HorizontalTextWithSubtext(
                  label: 'Sigla do Estado:',
                  value: district.stateAcronym,
                ),
                HorizontalTextWithSubtext(
                  label: 'ID do Município:',
                  value: district.municipalityId.toString(),
                ),
                HorizontalTextWithSubtext(
                  label: 'Microrregião:',
                  value: district.microRegionName,
                ),
                HorizontalTextWithSubtext(
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monetizze_app/core/shared/presentation/ui/widgets/appbar_widget.dart';

import '../../../../../core/shared/presentation/ui/widgets/vertical_text_with_subtext_widget.dart';
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
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalTextWithSubtextWidget(
                  label: 'Município:',
                  value: district.municipalityName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Estado:',
                  value: district.stateName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Sigla do Estado:',
                  value: district.stateAcronym,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'ID do Município:',
                  value: district.municipalityId.toString(),
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Microrregião:',
                  value: district.microRegionName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Mesorregião:',
                  value: district.mesoRegionName,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: district.municipalityName),
                  );
                },
                child: const Text('Copiar dados'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

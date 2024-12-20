import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monetizze_app/core/shared/presentation/ui/widgets/appbar_widget.dart';
import 'package:monetizze_app/modules/district/infra/dtos/district_dto.dart';

import '../../../../../core/shared/presentation/ui/widgets/vertical_text_with_subtext_widget.dart';
import '../../../../../core/utils/constants/style_constants.dart';
import '../../../domain/entities/district_entity.dart';

class DistrictDetailsPage extends StatefulWidget {
  final DistrictEntity district;

  const DistrictDetailsPage({super.key, required this.district});

  @override
  State<DistrictDetailsPage> createState() => _DistrictDetailsPageState();
}

class _DistrictDetailsPageState extends State<DistrictDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbarWidget(
        title:
            '${widget.district.municipalityName} - ${widget.district.stateAcronym}',
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
                  value: widget.district.municipalityName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Estado:',
                  value: widget.district.stateName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Sigla do Estado:',
                  value: widget.district.stateAcronym,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'ID do Município:',
                  value: widget.district.municipalityId.toString(),
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Microrregião:',
                  value: widget.district.microRegionName,
                ),
                VerticalTextWithSubtextWidget(
                  label: 'Mesorregião:',
                  value: widget.district.mesoRegionName,
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
                    ClipboardData(
                        text: DistrictDto.entityToMap(widget.district)
                            .toString()),
                  );
                },
                child: const Text('Copiar objeto'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

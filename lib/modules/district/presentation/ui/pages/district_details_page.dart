import 'package:flutter/material.dart';
import 'package:monetizze_app/core/shared/presentation/ui/widgets/appbar_widget.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Município:', district.municipalityName),
            _buildDetailRow('Estado:', district.stateName),
            _buildDetailRow('Sigla do Estado:', district.stateAcronym),
            _buildDetailRow(
                'ID do Município:', district.municipalityId.toString()),
            _buildDetailRow('Microrregião:', district.microRegionName),
            _buildDetailRow('Mesorregião:', district.mesoRegionName),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

class DistrictCardWidget extends StatelessWidget {
  final DistrictEntity district;
  final VoidCallback onCardTapCallback;
  const DistrictCardWidget({
    super.key,
    required this.district,
    required this.onCardTapCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapCallback,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            district.municipalityName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                district.stateName,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Sigla: ${district.stateAcronym}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Text(
              district.stateAcronym,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monetizze_app/core/utils/constants/style_constants.dart';
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
    const defaultPadding = StyleConstants.kScreenPadding;
    const halfDefaultPadding = StyleConstants.kScreenPaddingHalf;
    return GestureDetector(
      onTap: onCardTapCallback,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(
          vertical: halfDefaultPadding,
          horizontal: 4.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 4.0,
              ),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(defaultPadding),
            title: Text(
              district.municipalityName,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              overflow: TextOverflow.ellipsis,
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
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                district.stateAcronym,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

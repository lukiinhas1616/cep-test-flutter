import 'package:flutter/material.dart';
import 'package:monetizze_app/core/utils/constants/style_constants.dart';

class HorizontalTextWithSubtext extends StatelessWidget {
  const HorizontalTextWithSubtext({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: StyleConstants.kScreenPaddingHalf),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

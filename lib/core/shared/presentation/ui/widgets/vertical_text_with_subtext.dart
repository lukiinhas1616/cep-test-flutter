import 'package:flutter/material.dart';
import 'package:monetizze_app/core/utils/constants/style_constants.dart';

class VerticalTextWithSubtext extends StatelessWidget {
  const VerticalTextWithSubtext({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
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

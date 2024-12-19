import 'package:flutter/material.dart';

import '../../../../utils/constants/style_constants.dart';

class VerticalTextWithSubtextWidget extends StatelessWidget {
  const VerticalTextWithSubtextWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    const halfDefaultPadding = StyleConstants.kScreenPaddingHalf;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: halfDefaultPadding,
          horizontal: 4.0,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 4.0,
              ),
            ),
          ),
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
        ),
      ),
    );
  }
}

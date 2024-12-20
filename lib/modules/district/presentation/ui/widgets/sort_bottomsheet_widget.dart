import 'package:flutter/material.dart';

enum SortOption {
  none,
  name,
  state,
}

class SortBottomSheetWidget extends StatefulWidget {
  SortBottomSheetWidget({
    super.key,
    required this.currentSelectedOption,
    required this.onSelectedOption,
  });

  SortOption currentSelectedOption;
  Function(SortOption) onSelectedOption;

  @override
  State<SortBottomSheetWidget> createState() => _SortBottomSheetWidgetState();
}

class _SortBottomSheetWidgetState extends State<SortBottomSheetWidget> {
  TextStyle? _style(SortOption option) {
    if (option == widget.currentSelectedOption) {
      return Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold);
    }
    return Theme.of(context).textTheme.bodyMedium;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ordenar por',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: Text('Nenhum', style: _style(SortOption.none)),
            onTap: () {
              widget.onSelectedOption(SortOption.none);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Nome', style: _style(SortOption.name)),
            onTap: () {
              widget.onSelectedOption(SortOption.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Estado', style: _style(SortOption.state)),
            onTap: () {
              widget.onSelectedOption(SortOption.state);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

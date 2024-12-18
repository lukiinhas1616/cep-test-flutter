import 'package:flutter/material.dart';

class DefaultAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DefaultAppbarWidget({
    super.key,
    required this.title,
    this.refreshCallback,
  });

  final String title;
  final VoidCallback? refreshCallback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      actions: [
        if (refreshCallback != null)
          IconButton(
            onPressed: refreshCallback,
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
      ],
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

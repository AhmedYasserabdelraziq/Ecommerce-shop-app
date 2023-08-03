import 'package:flutter/material.dart';

ListTile buildListTile(
    BuildContext context, IconData icon, String text, VoidCallback onPress) {
  return ListTile(
    leading: Icon(
      icon,
      color: Theme.of(context).colorScheme.primary,
      size: 33,
    ),
    title: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
    ),
    onTap:
      onPress,
  );
}

import 'package:flutter/material.dart';
import 'package:information_student/controllers/theme_controller.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            themeController.isDark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
          onPressed: () {
            context.read<ThemeController>().toggleTheme();
          },
        ),
      ],
    );
  }
  
  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

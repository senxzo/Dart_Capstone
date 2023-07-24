import 'package:flutter/material.dart';
import 'package:stressed_out/pages/settings_page.dart';
import 'package:stressed_out/pages/user/profile_page.dart';
import 'package:stressed_out/utils/app_colors.dart';

class CommonComponents {
  // This is common for all pages with back button
  // and a page title in the middle.
  static AppBar commonAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.primaryAccentColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryAccentColor,
          ),
        ),
      ),
    );
  }

  // This app bar is for tabs in home pages
  // showing a profile icon, title, and settings icon.
  static AppBar tabbedAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.account_circle_rounded,
          color: AppColors.primaryAccentColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        },
      ),
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryAccentColor,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: AppColors.primaryAccentColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  static InputDecoration getInputDecoration(String text) {
    return InputDecoration(
      labelText: text,
      border: const UnderlineInputBorder(borderSide: BorderSide.none),
      filled: true,
      fillColor: AppColors.primarySwatch.shade50,
      /*fillColor: Colors.white24,*/
      /*hintStyle: TextStyle(
        color: AppColors.primaryAccentColor,
      ),*/
    );
  }
}

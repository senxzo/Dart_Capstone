import 'package:flutter/material.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/utils/app_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.commonAppBar(context, AppConstants.settings),
      body: Center(
        child: Text('Settings goes here!'),
      ),
    );
  }
}

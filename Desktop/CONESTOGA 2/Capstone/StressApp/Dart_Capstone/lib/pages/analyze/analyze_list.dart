import 'package:flutter/material.dart';

class AnalyzeList extends StatefulWidget {
  const AnalyzeList({Key? key}) : super(key: key);

  @override
  State<AnalyzeList> createState() => _AnalyzeListState();
}

class _AnalyzeListState extends State<AnalyzeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonComponents.tabbedAppBar(context, AppConstants.analyze),
      body: const Center(
        child: Text('Reports will be shown here!!'),
      ),
    );
  }
}

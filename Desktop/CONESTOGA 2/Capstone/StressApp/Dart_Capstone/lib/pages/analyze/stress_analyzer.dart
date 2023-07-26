import 'package:flutter/material.dart';
import 'package:stressed_out/pages/analyze/questions_page.dart';
import 'package:stressed_out/pages/components/common_components.dart';
import 'package:stressed_out/utils/app_colors.dart';
import 'package:stressed_out/utils/app_constants.dart';

class StressAnalyzer extends StatefulWidget {
  @override
  _StressAnalyzerState createState() => _StressAnalyzerState();
}

class _StressAnalyzerState extends State<StressAnalyzer>
    with SingleTickerProviderStateMixin {
  // Define the list of tab titles
  final List<String> _tabTitles = ["Questionnaire", "Scan Face"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponents.navigationTabBar(
        context,
        AppConstants.stressAnalyzer,
        TabBar(
          controller: _tabController,
          tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
          labelColor: AppColors.primarySwatch.shade900,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          QuestionsPage(),
          Center(
            child: Text(
              "Coming Soon!!",
              style: TextStyle(
                color: AppColors.primarySwatch.shade900,
                fontSize: 32.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

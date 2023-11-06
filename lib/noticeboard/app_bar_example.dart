import 'package:flutter/material.dart';
import 'package:running_app/recommendation_crew_page.dart';
import 'package:running_app/recruitment_crew_page.dart';

class AppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 2;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('신사동'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '모집중인 크루',
              ),
              Tab(
                text: '추천 크루',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            RecruitmentCrewPage(),
            RecommendationCrewPage(),
          ],
        ),
      ),
    );
  }
}

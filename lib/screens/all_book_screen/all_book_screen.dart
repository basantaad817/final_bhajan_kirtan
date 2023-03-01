import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bhajan_kirtan_byBasanta/components/drawer.dart';
import 'package:bhajan_kirtan_byBasanta/screens/all_book_screen/components/body.dart';
import 'package:bhajan_kirtan_byBasanta/styles.dart';
import 'package:bhajan_kirtan_byBasanta/utils/search.dart';

class AllBookScreen extends StatelessWidget {
  static const String routeName = '/all-book';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Colors.white,
              ),
              splashRadius: 22,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        centerTitle: true,
        title: Text('All Books', style: appBarTitle()),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.white,
            ),
            splashRadius: 22,
            onPressed: () => showSearch(
              context: context,
              delegate: Search(),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: AllBookScreenBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bhajan_kirtan_byBasanta/styles.dart';
import 'package:bhajan_kirtan_byBasanta/utils/search.dart';

import '../../components/drawer.dart';
import '../../screens/add_book_screen/add_book_screen.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset('assets/icons/menu.svg',
                  color: Colors.white),
              splashRadius: 22,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
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
          TextButton(
            child: Text(
              'Upload Book',
              style: actionButtonText(),
            ),
            onPressed: () => Navigator.of(context).pushNamed(
              AddBookScreen.routeName,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: HomeScreenBody(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/books_provider.dart';
import 'routes.dart';
import 'screens/home_screen/home_screen.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BhajanEbookAdmin());
}

class BhajanEbookAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Books(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bhajan Ebook Admin',
        theme: theme(),
        home: HomeScreen(),
        routes: routes(),
      ),
    );
  }
}

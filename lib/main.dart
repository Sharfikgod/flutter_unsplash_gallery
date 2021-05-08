import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/galery_screen.dart';
import './api_images.dart';
import './screen/image_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ApiImages(),
        ),
      ],
      child: MaterialApp(
        home: Galery(),
        routes: {
          ImageDetailScreen.routeName: (ctx) => ImageDetailScreen(),
        },
      ),
    );
  }
}

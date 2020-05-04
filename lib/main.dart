import 'package:flutter/material.dart';
import 'package:prime_demo/pages/content_page.dart';
import 'package:prime_demo/store/counter_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterStore>(
          create: (_) => CounterStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContentPage(),
      ),
    );
  }
}

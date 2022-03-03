import 'package:flutter/material.dart';
import '../providers/beer_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/beerItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BeerProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'World Beers',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          home: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<BeerProvider>(context, listen: false).getBeers();
    // if (beers) {
    return Consumer<BeerProvider>(builder: (context, value, child) {
      if (value.initialized) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black38,
              titleTextStyle: TextStyle(color: Colors.amber),
              title: Text("World Beers"),
            ),
            body: ListView(
              children: [...value.beers.map((beer) => BeerItem(beer))],
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:world_beers/models/beer.dart';
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
              appBarTheme: AppBarTheme(
                  // backgroundColor: Colors.blue,
                  foregroundColor:
                      Colors.amber //here you can give the text color
                  ),
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
                  .copyWith(secondary: Colors.orange)),
          home: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filterString = "";

  void filterBeers() {}

  @override
  Widget build(BuildContext context) {
    Provider.of<BeerProvider>(context, listen: false).getBeers();
    return Consumer<BeerProvider>(builder: (context, value, child) {
      if (value.initialized) {
        return Scaffold(
            appBar: AppBar(
              title: Text("World Beers"),
            ),
            body: Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                          onChanged: (String val) => setState(() {
                                filterString = val;
                              }),
                          decoration:
                              InputDecoration(prefixIcon: Icon(Icons.search)))),
                  Expanded(
                    child: ListView(
                      children: [
                        ...value.beers
                            .where((beer) => beer.name
                                .toLowerCase()
                                .contains(filterString.toLowerCase()))
                            .map((beer) => BeerItem(beer))
                      ],
                    ),
                  )
                ],
              ),
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

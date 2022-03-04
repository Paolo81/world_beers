import 'package:flutter/material.dart';
import '../providers/beer_provider.dart';
import 'package:provider/provider.dart';
import 'screens/beer_detail.dart';
import 'utils/palette.dart';
import 'widgets/beer_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => BeerProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'World Beers',
          theme: ThemeData(
              appBarTheme: AppBarTheme(foregroundColor: Colors.amber),
              colorScheme:
                  ColorScheme.fromSwatch(primarySwatch: Palette.darkGrey)
                      .copyWith(secondary: Palette.orange)),
          home: HomePage(),
          routes: {BeerDetail.routeName: (ctx) => BeerDetail()},
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filterString = "";

  @override
  Widget build(BuildContext context) {
    Provider.of<BeerProvider>(context, listen: false).getBeers();
    return Consumer<BeerProvider>(builder: (context, value, child) {
      if (value.initialized) {
        return Scaffold(
            appBar: AppBar(
              title: Text("World Beers"),
            ),
            body: Column(
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
            ));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

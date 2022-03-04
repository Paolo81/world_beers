import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_beers/providers/beer_provider.dart';

class BeerDetail extends StatelessWidget {
  static const routeName = '/beer-detail';

//- i valori first_brewed, food_pairing, brewers_tips
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final beer = Provider.of<BeerProvider>(context).findById(id);

    return Scaffold(
      appBar: AppBar(title: Text(beer.name)),
      body: Container(
        padding: EdgeInsets.all(20),
        // color: Palette.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Center(
                child: Image.network(
                  beer.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  title: Row(children: const [
                    Icon(Icons.cake, size: 18),
                    Text("Firs Brew")
                  ]),
                  subtitle: Text(beer.firstBrewed),
                ),
                ListTile(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.dining,
                          size: 18,
                        ),
                        Text("Food Pairing")
                      ],
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...beer.foodPairing.map((str) => Text(str))
                        ])),
                ListTile(
                  title: Row(
                    children: const [
                      Icon(
                        Icons.info,
                        size: 18,
                      ),
                      Text("Brewer Tips"),
                    ],
                  ),
                  subtitle: Text(
                    beer.brewersTips,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

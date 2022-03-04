import 'package:flutter/material.dart';

import '../models/beer.dart';

class BeerItem extends StatelessWidget {
  final Beer beer;

  const BeerItem(this.beer);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10,
      onTap: () => {},
      leading: Image.network(
        beer.imageUrl,
        fit: BoxFit.contain,
      ),
      title: Text(beer.name),
      subtitle: Column(
        children: [
          Text(beer.description),
          Text(
            "Vol : ${beer.abv} - Ibu : ${beer.ibu}",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      dense: false,
    );
  }
}

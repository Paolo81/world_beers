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
      title: RichText(
          text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              text: beer.name)),
      subtitle: Column(children: [
        Text(beer.description),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Vol : "),
                  TextSpan(
                      text: beer.abv,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Ibu : "),
                  TextSpan(
                      text: beer.ibu,
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
              ),
            )
          ],
        ),
      ]),
      dense: false,
    );
  }
}

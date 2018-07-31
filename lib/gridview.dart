import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gridview/country.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountyGridView extends StatelessWidget {
  final List<Country> country;

  CountyGridView({Key key, this.country}) : super(key: key);

  Card getStructuredGridCell(Country country) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new SvgPicture.network(
              country.flag.replaceAll('https', 'http'),
              height: 130.0,
              width: 100.0,
              placeholderBuilder: (BuildContext context) => new Container(
                  padding: const EdgeInsets.all(60.0),
                  child: const CircularProgressIndicator()),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(country.name),
                  new Text(country.nativeName),
                  new Text(country.capital),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
//      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.80,
//      mainAxisSpacing: 1.0,
//      crossAxisSpacing: 1.0,
      children: List.generate(country.length, (index) {
        return getStructuredGridCell(country[index]);
      }),
    );
  }
}

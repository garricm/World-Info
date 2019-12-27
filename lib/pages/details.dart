import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_info/pages/country.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final Country country;

  DetailPage({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget networkSvg = SvgPicture.network(
      country.flag,
      semanticsLabel: country.code,
      fit: BoxFit.cover,
      placeholderBuilder: (BuildContext context) => ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 64,
            maxHeight: 64,
          ),
          child: Center(child: const CircularProgressIndicator())),
    );

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    background: networkSvg),
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Card(
                  child: ListTile(
                title: Text('Name : ' + country.name,
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              )),
              Card(
                  child: ListTile(
                title: Text('Capital : ' + country.capital,
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              )),
              Card(
                  child: ListTile(
                title: Text('Region : ' + country.region,
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              )),
              Card(
                  child: ListTile(
                title: Text(
                    'Population : ' + NumberFormat().format(country.population),
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              )),
            ],
          )),
    );
  }
}

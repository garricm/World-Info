import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_info/pages/country.dart';
import 'package:world_info/service/country_service.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<Country> countries = List();

  @override
  void initState() {
    super.initState();

    CountryService.getCountryList().then((countryList) {
      print(countryList);
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {'list': countryList});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}

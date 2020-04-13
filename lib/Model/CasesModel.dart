

import 'CountryInfo.dart';

class CasesModel{
  String country;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  int todayCases;
  int todayDeaths;
  CountryInfo flag;


CasesModel({ this.country, this.confirmed,this.deaths, this.recovered, this.active,this.todayCases,this.todayDeaths,this.flag});
}
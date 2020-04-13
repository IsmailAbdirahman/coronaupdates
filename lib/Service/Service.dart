import 'package:coronaupdates/Model/CasesModel.dart';
import 'package:coronaupdates/Model/CountryInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<CasesModel> theCasesList = [];
List<CasesModel> searchedCasesList = [];
var name;

Future<void> getData() async {
  String url = "https://corona.lmao.ninja/v2/countries";
  var response = await http.get(url);
  var jsonData = json.decode(response.body);
  print("LAST UPDATE $jsonData");

  jsonData.forEach((element) {
    name = element['country'];
    CasesModel casesModel = CasesModel(
        flag:CountryInfo.fromJson(element['countryInfo']) ,
        country: element['country'],
        confirmed: element['cases'],
        deaths: element['deaths'],
        recovered: element['recovered'],
        active: element['active'],
        todayCases: element['todayCases'],
        todayDeaths: element['todayDeaths'],
      );

      theCasesList.add(casesModel);


  });
}



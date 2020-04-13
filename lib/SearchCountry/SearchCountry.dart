import 'package:coronaupdates/Home/Home.dart';
import 'package:coronaupdates/Model/CasesModel.dart';
import 'package:flutter/material.dart';

class SearchCountryClass extends SearchDelegate {
  final List<CasesModel> searchedCountriesName;

  SearchCountryClass({this.searchedCountriesName});


  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Color.fromARGB(240, 119, 124, 224),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      hintColor: Colors.white,
      primaryColorBrightness: Brightness.dark,
      primaryTextTheme: theme.textTheme,

    );
  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final List suggestionList = query.isEmpty
        ? searchedCountriesName
        : searchedCountriesName
            .where((element) => element.country
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();
    return Container(
      child: ListView.builder(
          primary: false,
          itemCount: suggestionList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SearchCasesTile(
              country: suggestionList[index].country,
              confirmed: suggestionList[index].confirmed,
              active: suggestionList[index].active,
              flag: suggestionList[index].flag.flag,
              deaths: suggestionList[index].deaths,
              todayCases: suggestionList[index].todayCases,
              todayDeaths: suggestionList[index].todayDeaths,
              recovered: suggestionList[index].recovered,
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List suggestionList = query.isEmpty
        ? searchedCountriesName
        : searchedCountriesName
            .where((element) => element.country
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
        primary: false,
        itemCount: suggestionList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SearchCasesTile(
            country: suggestionList[index].country,
            confirmed: suggestionList[index].confirmed,
            active: suggestionList[index].active,
            flag: suggestionList[index].flag.flag,
            deaths: suggestionList[index].deaths,
            todayCases: suggestionList[index].todayCases,
            todayDeaths: suggestionList[index].todayDeaths,
            recovered: suggestionList[index].recovered,
          );
        });
  }
}

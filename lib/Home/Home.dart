import 'package:coronaupdates/Model/CasesModel.dart';
import 'package:coronaupdates/SearchCountry/SearchCountry.dart';
import 'package:coronaupdates/Service/Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//home class
//created comment branch
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CasesModel> cases = List<CasesModel>();
  bool _loading = false;
  String searchName = "";

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  getAllData() async {
    await getData();
    setState(() {
      cases = theCasesList;
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(100, 109, 114, 224),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(100, 109, 114, 224),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate:
                          SearchCountryClass(searchedCountriesName: cases));
                },
              )
            ],
          ),
          body: Center(
            child: _loading
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    // margin: EdgeInsets.only(top: 50, left: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              primary: false,
                              itemCount: cases.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return CasesTile(
                                  country: cases[index].country,
                                  confirmed: cases[index].confirmed,
                                  active: cases[index].active,
                                  flag: cases[index].flag.flag,
                                  deaths: cases[index].deaths,
                                  todayCases: cases[index].todayCases,
                                  todayDeaths: cases[index].todayDeaths,
                                  recovered: cases[index].recovered,
                                );
                              }),
                        ],
                      ),
                    ))
                : CircularProgressIndicator(),
          )),
    );
  }
}

class CasesTile extends StatelessWidget {
  final country,
      confirmed,
      active,
      flag,
      deaths,
      todayCases,
      todayDeaths,
      recovered;

  CasesTile(
      {@required this.country,
      @required this.confirmed,
      @required this.active,
      @required this.flag,
      @required this.deaths,
      @required this.todayCases,
      @required this.todayDeaths,
      @required this.recovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(right: 10, top: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 3, 4, 33),
        boxShadow: [
          BoxShadow(
            offset: Offset(10, 10),
            color: Color.fromARGB(100, 3, 4, 33),
            blurRadius: 10,
          ),
          BoxShadow(
              offset: Offset(-10, -10),
              color: Color.fromARGB(100, 3, 4, 33),
              blurRadius: 10)
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${country.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Container(height: 60, width: 60, child: Image.network(flag)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Confirmed: ${confirmed.toString()}",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                ),
                Text(
                  "Active: ${active.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.yellow[900]),
                ),
                Text(
                  "Death: ${deaths.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                Text(
                  "Today Cases: ${todayCases.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.yellow[700]),
                ),
                Text(
                  "Today deaths: ${todayDeaths.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white70),
                ),
                Text(
                  "Recovered : ${recovered.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.green),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchCasesTile extends StatelessWidget {
  final country,
      confirmed,
      active,
      flag,
      deaths,
      todayCases,
      todayDeaths,
      recovered;

  SearchCasesTile(
      {@required this.country,
      @required this.confirmed,
      @required this.active,
      @required this.flag,
      @required this.deaths,
      @required this.todayCases,
      @required this.todayDeaths,
      @required this.recovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(right: 10, top: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 3, 4, 33),
        boxShadow: [
          BoxShadow(
            offset: Offset(10, 10),
            color: Color.fromARGB(100, 3, 4, 33),
            blurRadius: 10,
          ),
          BoxShadow(
              offset: Offset(-10, -10),
              color: Color.fromARGB(100, 3, 4, 33),
              blurRadius: 10)
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${country.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Container(height: 60, width: 60, child: Image.network(flag)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Confirmed: ${confirmed.toString()}",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                ),
                Text(
                  "Active: ${active.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.yellow[900]),
                ),
                Text(
                  "Death: ${deaths.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                Text(
                  "Today Cases: ${todayCases.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.yellow[700]),
                ),
                Text(
                  "Today deaths: ${todayDeaths.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white70),
                ),
                Text(
                  "Recovered : ${recovered.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.green),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

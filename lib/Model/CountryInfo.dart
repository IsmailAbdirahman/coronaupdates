



class CountryInfo {
  final String flag;
  CountryInfo({this.flag});




  factory CountryInfo.fromJson(Map<String, dynamic> json){
    return CountryInfo(
        flag: json['flag'],
    );
  }
}

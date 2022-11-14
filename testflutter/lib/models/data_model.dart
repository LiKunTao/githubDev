class DataModel {
  final String? str;
  final int? aNum;

  DataModel(this.str, this.aNum);

  String getContent (){
    return "${str}";
  }
}
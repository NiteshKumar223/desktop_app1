class GhaatData {
  final String sitetype;
  final String sitename;
  final String sitelessee;
  final String materialtype;
  final String registration;
  final String oldregistration;
  final String activated;

  GhaatData(
      {required this.sitetype,
      required this.sitename,
      required this.sitelessee,
      required this.materialtype,
      required this.registration,
      required this.oldregistration,
      required this.activated});

  factory GhaatData.fromJson(Map<String, dynamic> json) => GhaatData(
        sitetype: json['sitetype'],
        sitename: json['sitename'],
        sitelessee: json['sitelessee'],
        materialtype: json['materialtype'],
        registration: json['registration'],
        oldregistration: json['oldregistration'],
        activated: json['activated'],
      );
}

List<GhaatData> ghaatdata = [
  GhaatData(
      sitetype: "TEST TYPE",
      sitename: "DEMO",
      sitelessee: "DEMO LESSEE",
      materialtype: "MORRUM",
      registration: "0000000000",
      oldregistration: "1111111111",
      activated: "14/05/2023"),
  GhaatData(
      sitetype: "TEST TYPE",
      sitename: "DEMO",
      sitelessee: "DEMO LESSEE",
      materialtype: "MORRUM",
      registration: "0000000000",
      oldregistration: "1111111111",
      activated: "14/05/2023"),
  GhaatData(
      sitetype: "TEST TYPE",
      sitename: "DEMO",
      sitelessee: "DEMO LESSEE",
      materialtype: "MORRUM",
      registration: "0000000000",
      oldregistration: "1111111111",
      activated: "14/05/2023"),
];

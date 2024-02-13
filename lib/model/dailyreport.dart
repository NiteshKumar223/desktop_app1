
class DailyReport{
  final String vehicletype;
  final String entrycount;
  final String exitcount;

  DailyReport({
    required this.vehicletype, 
    required this.entrycount, 
    required this.exitcount
});
factory DailyReport.fromJson(Map<String, dynamic> json) => DailyReport(
  vehicletype: json['vehicletype'], 
  entrycount: json['entrycount'], 
  exitcount: json['exitcount']
);
}
List <DailyReport> dailyreportdata = [
  DailyReport(
    vehicletype: 'NO', 
    entrycount: 'RECORD', 
    exitcount: 'FOUND'
  )
];
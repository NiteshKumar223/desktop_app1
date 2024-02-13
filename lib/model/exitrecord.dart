
class ExitRecord{
  final String emm11no;
  final String receiptno;
  final String drivername;
  final String vehicletype;
  final String vehiclenumber;
  final String entrydate;
  final String entrytime;
  final String exitdate;
  final String exittime;
  final String loadingtype;
  final String materialqty;

  ExitRecord({
    required this.emm11no, 
    required this.receiptno, 
    required this.drivername, 
    required this.vehicletype, 
    required this.vehiclenumber, 
    required this.entrydate, 
    required this.entrytime, 
    required this.exitdate, 
    required this.exittime, 
    required this.loadingtype, 
    required this.materialqty
});

factory ExitRecord.fromJson(Map<String, dynamic> json) => ExitRecord(
  emm11no: json['emm11no'], 
  receiptno: json['receiptno'], 
  drivername: json['drivername'], 
  vehicletype: json['vehicletype'], 
  vehiclenumber: json['vehiclenumber'], 
  entrydate: json['entrydate'], 
  entrytime: json['entrytime'], 
  exitdate: json['exitdate'], 
  exittime: json['exittime'], 
  loadingtype: json['loadingtype'], 
  materialqty: json['materialqty']
  );

}

List<ExitRecord> exitdata = [
  ExitRecord(
    emm11no: 'NO', 
    receiptno: 'RECORD', 
    drivername: 'FOUND', 
    vehicletype: '', 
    vehiclenumber: '', 
    entrydate: '', 
    entrytime: '', 
    exitdate: '', 
    exittime: '', 
    loadingtype: '', 
    materialqty: ''
  )
];
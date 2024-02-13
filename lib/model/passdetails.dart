
class PassDetails{
  final int receiptno;
  final String vehiclno;
  final String vehicletype;
  final String driver;
  final String contactno;
  final String licenseno;
  final String destination;
  final double quantity;
  final String loadingtype;
  final String entrydate;
  final String entrytime;
  final double weightunloaded;

  PassDetails({
    required this.receiptno,
    required this.vehiclno,
    required this.vehicletype,
    required this.driver,
    required this.contactno,
    required this.licenseno,
    required this.destination,
    required this.quantity,
    required this.loadingtype,
    required this.entrydate,
    required this.entrytime,
    required this.weightunloaded});

  factory PassDetails.fromJson(Map<String, dynamic> json ) => PassDetails(
    receiptno: json['receiptno'],
    vehiclno: json['vehiclno'],
    vehicletype: json['vehicletype'],
    driver: json['driver'],
    contactno: json['contactno'],
    licenseno: json['licenseno'],
    destination: json['destination'],
    quantity: json['quantity'],
    loadingtype: json['loadingtype'],
    entrydate: json['entrydate'],
    entrytime: json['entrytime'],
    weightunloaded: json['weightunloaded']
  );

}
List<PassDetails> passdata = [
  PassDetails(
    receiptno: 101, 
    vehiclno: "RECORD", 
    vehicletype: "FOUND", 
    driver: "!!!", 
    contactno: "", 
    licenseno: "", 
    destination: "", 
    quantity: 12.0, 
    loadingtype: "", 
    entrydate: "", 
    entrytime: "", 
    weightunloaded: 8451.0)
];
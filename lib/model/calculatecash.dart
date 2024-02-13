class CalculateCash{
  final String vehicletype;
  final String count;
  final String quantityinton;
  final String value;
  final String totalcash;

  CalculateCash({
    required this.vehicletype, 
    required this.count, 
    required this.quantityinton, 
    required this.value, 
    required this.totalcash
});

factory CalculateCash.fromJson(Map<String, dynamic> json) => CalculateCash(
  vehicletype: json['vehicletype'],
  count: json['count'], 
  quantityinton: json['quantityinton'], 
  value: json['value'], 
  totalcash: json['totalcash']
  );
}
List<CalculateCash> calculatecashfirst = [
  CalculateCash(
    vehicletype: "6 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
];
List<CalculateCash> calculatecashsecond = [
  CalculateCash(
    vehicletype: "6 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "10 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "12 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "14 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "16 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "18 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "20 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "22 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "24 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "28 TYPE", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "BUGGI (B)", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "BUGGI (S)", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "DUMPER (10)", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  ),
  CalculateCash(
    vehicletype: "DUMPER (12)", 
    count: "0", 
    quantityinton: "0", 
    value: "0", 
    totalcash: "0",
  )


];
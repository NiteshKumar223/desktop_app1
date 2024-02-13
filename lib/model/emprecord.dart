
class EmpRecord{
  final String empsitename;
  final String emplogintype;
  final String empname;
  final String empdesignation;
  final String emppricontact;
  final String empseccontact;
  final String empsalary;
  final String empidtype;
  final String empidnumber;
  final String empaddress;
  final String empaccountno;
  final String empbankifsc;
  final String empjoiningdate;

  EmpRecord({
    required this.empsitename, 
    required this.emplogintype, 
    required this.empname, 
    required this.empdesignation, 
    required this.emppricontact, 
    required this.empseccontact, 
    required this.empsalary, 
    required this.empidtype, 
    required this.empidnumber, 
    required this.empaddress, 
    required this.empaccountno, 
    required this.empbankifsc, 
    required this.empjoiningdate
});

    factory EmpRecord.fromJson(Map<String, dynamic> json) => EmpRecord(
      empsitename: json['empsitename'],
      emplogintype: json['emplogintype'],
      empname: json['empname'],
      empdesignation: json['empdesignation'],
      emppricontact: json['emppricontact'],
      empseccontact: json['empseccontact'],
      empsalary: json['empsalary'],
      empidtype: json['empidtype'],
      empidnumber: json['empidnumber'],
      empaddress: json['empaddress'],
      empaccountno: json['empaccountno'],
      empbankifsc: json['empbankifsc'],
      empjoiningdate: json['empjoiningdate']
      );
}

List<EmpRecord> empdata = [
  EmpRecord(
    empsitename: '', 
    emplogintype: 'NO', 
    empname: 'RECORD', 
    empdesignation: 'FOUND', 
    emppricontact: '', 
    empseccontact: '', 
    empsalary: '', 
    empidtype: '', 
    empidnumber: '', 
    empaddress: '', 
    empaccountno: '', 
    empbankifsc: '', 
    empjoiningdate: '' ),
];
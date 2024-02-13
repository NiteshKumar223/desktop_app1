

import 'package:desktop_app1/customwidget/custom_icon_btn.dart';
import 'package:desktop_app1/model/emprecord.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';
import 'admaddempdialogform.dart';

class AdmPageEmpRecord extends StatefulWidget {
  const AdmPageEmpRecord({super.key});

  @override
  State<AdmPageEmpRecord> createState() => _AdmPageEmpRecordState();
}

class _AdmPageEmpRecordState extends State<AdmPageEmpRecord> {
  TextEditingController controllerSearchQuery = TextEditingController();

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  final empheader = [
    'Site Name',
    'Login Type',
    'Name',
    'Designation',
    'Pri. Contact',
    'Sec. Contact',
    'Salary',
    'Id Type',
    'Id Number',
    'Address',
    'Account No',
    'Bank IFSC',
    'Joining Date'
  ];
  List<EmpRecord> selectedempdata = [];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var minsize=925;
    return Container(
      margin: const EdgeInsets.only(top: 5.0,right: 5.0,bottom: 5.0),
      height: screensize.height,
      width: screensize.width,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: AppColor.colorgrey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          // Header content
          SizedBox(
            height: 50,
            width: screensize.width,
            child: Row(children: [
              const SizedBox(width: 10.0),
              const Text(
                "Employee Name :  ",
                style: TextStyle(fontSize: 16.0),
              ),
              Expanded(
                child: SizedBox(
                  height: 30.0,
                  child: TextFormField(
                    controller: controllerSearchQuery,
                    decoration: const InputDecoration(
                      hintText: "SEARCH",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0)
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30.0),
              CustomIconBtn(
                ontap: () {
                  debugPrint("Search Button clicked");
                },
                icon: Icons.search
              ),
              const SizedBox(width:40.0),
              CustomIconBtn(
                ontap: () {
                  showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const AdmAddEmpDialogForm();
                        });
                  debugPrint("Add employee Button clicked");
                },
                icon: Icons.person_add_alt_1
              ),
              const SizedBox(width: 40.0),
              CustomIconBtn(
                ontap: () {
                  debugPrint("edit Button clicked");
                },
                icon: Icons.edit
              ),
              const SizedBox(width: 40.0),
              CustomIconBtn(
                ontap: () {
                  debugPrint("delete Button clicked");
                },
                icon: Icons.delete
              ),
              const SizedBox(width: 30.0),
            ],),
          ),

          // Employee Record Heading and lining
          Row(children: [
            const SizedBox(width: 5.0),
            const Text(
              "Employee Record ",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Expanded(
              child: Container(
                height: 0.5,
                color: AppColor.colorgrey,
              ),
            )
          ],),

          // Table Content from here
          const SizedBox(height: 3.0),
          Container(
            height: screensize.height-130,
            width: screensize.width,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.colorgrey),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              )
            ),
            child: Scrollbar(
              controller: horizontalScroll,
              thumbVisibility: true,
              trackVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: ListView(
                controller: horizontalScroll,
                scrollDirection: Axis.horizontal,
                  children: [
                    Scrollbar(
                      controller: verticalScroll,
                      thumbVisibility: true,
                      trackVisibility: true,
                      scrollbarOrientation: ScrollbarOrientation.right,
                      child: SingleChildScrollView(
                        controller: verticalScroll,
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                            border: TableBorder.all(
                                width: 0.3, color: AppColor.colorgrey),
                            columnSpacing: 60,
                            headingRowHeight: 40.0,
                            dataRowHeight: 30.0,
                            headingTextStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorblack),
                            dataTextStyle: TextStyle(
                                fontSize: 12.0, color: AppColor.colorblack),
                            columns: getColumns(empheader),
                            rows: getRows(empdata)),
                      ),
                    ),
                  ],
                ),
            ),
          )

        ],
      ),
    );
  }
  List<DataColumn> getColumns(List<String> empheader) => empheader
      .map((String empcolumn) => DataColumn(
            label: Text(empcolumn),
          ))
      .toList();

  List<DataRow> getRows(List<EmpRecord> empdata) => empdata
      .map((EmpRecord emprowdata) => DataRow(
              selected: selectedempdata.contains(emprowdata),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selectedempdata.add(emprowdata)
                        : selectedempdata.remove(emprowdata);
                  }),
              cells: [
                DataCell(Text(emprowdata.empsitename)),
                DataCell(Text(emprowdata.emplogintype)),
                DataCell(Text(emprowdata.empname)),
                DataCell(Text(emprowdata.empdesignation)),
                DataCell(Text(emprowdata.emppricontact)),
                DataCell(Text(emprowdata.empseccontact)),
                DataCell(Text(emprowdata.empsalary)),
                DataCell(Text(emprowdata.empidtype)),
                DataCell(Text(emprowdata.empidnumber)),
                DataCell(Text(emprowdata.empaddress)),
                DataCell(Text(emprowdata.empaccountno)),
                DataCell(Text(emprowdata.empbankifsc)),
                DataCell(Text(emprowdata.empjoiningdate))
              ]))
      .toList();
}
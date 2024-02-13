import 'package:desktop_app1/customwidget/custom_icon_btn.dart';
import 'package:desktop_app1/model/dailyinfodata.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/color.dart';

class EmpPageDailyInfo extends StatefulWidget {
  final String loginValue;
  const EmpPageDailyInfo({super.key,required this.loginValue});


  @override
  State<EmpPageDailyInfo> createState() => _EmpPageDailyInfoState();
  
}


class _EmpPageDailyInfoState extends State<EmpPageDailyInfo> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final dailyinfoheader = [
    'Entry',
    'Exit Date',
    'Receipt',
    'eMM11 No',
    'Vehicle',
    'Vehicle Type',
    'Driver Name',
    'Contact No',
    'Destination',
    'Quantity'
  ];
  List<DailyInfoData> selecteddailyinfodata = [];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: screensize.height,
        width: screensize.width,
        margin: const EdgeInsets.only(top: 5.0,right: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5,color: AppColor.colorgrey),
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          children: [
            // top header content
            SizedBox(
                height: 50.0,
                width: screensize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("  From :  ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: SizedBox(
                        height: 30.0,
                        // width: 280.0,
                        child: TextFormField(
                          controller: fromdate,
                          onTap: () async {
                            DateTime? frompicked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (frompicked != null) {
                              setState(() {
                                fromdate.text =
                                    DateFormat('EEEE ,  MMM  d ,  yyyy')
                                        .format(frompicked);
                              });
                            }
                          },
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Select From Date",
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    const Text("To :  ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: SizedBox(
                        height: 30.0,
                        // width: 280.0,
                        child: TextFormField(
                          controller: todate,
                          onTap: () async {
                            DateTime? topicked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (topicked != null) {
                              setState(() {
                                todate.text =
                                    DateFormat('EEEE ,  MMM  d ,  yyyy')
                                        .format(topicked);
                              });
                            }
                          },
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Select To Date",
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    CustomIconBtn(
                      icon: Icons.search,
                      ontap: () {
                        debugPrint("Search icon clicked");
                      },
                    ),
                    const SizedBox(width: 20.0),
                    if(widget.loginValue == "admin")
                    CustomIconBtn(
                      icon: Icons.article,
                      ontap: () {
                        debugPrint("excelsheet clicked");
                      },
                    ),
                    const SizedBox(width: 20.0),
                  ],
                )),
            // heading and lining
            Row(
              children: [
                const Text(
                  " Daily Information : ",
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(
                  child: Container(
                    height: 0.5,
                    // width: screensize.width - 323,
                    color: AppColor.colorgrey,
                  ),
                )
              ],
            ),
            // table content
            const SizedBox(height: 3.0),
            Container(
                height: screensize.height - 132,
                width: screensize.width,
                decoration: BoxDecoration(
                    border:Border.all(color: AppColor.colorgrey),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                child: Scrollbar(
                  controller: horizontalScroll,
                  trackVisibility: true,
                  thumbVisibility: true,
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: ListView(
                    controller: horizontalScroll,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Scrollbar(
                        controller: verticalScroll,
                        trackVisibility: true,
                        thumbVisibility: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          controller: verticalScroll,
                          child: DataTable(
                            border: TableBorder.all(
                                width: 0.3, color: AppColor.colorgrey),
                            columnSpacing:81.6,
                            headingRowHeight: 35.0,
                            dataRowHeight: 30.0,
                            headingTextStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorblack),
                            dataTextStyle: TextStyle(
                                fontSize: 12.0, color: AppColor.colorblack),
                            columns: getColumns(dailyinfoheader),
                            rows: getRows(dailyinfodata),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> dailyinfoheader) => dailyinfoheader
      .map((String dailyinfoheadername) => DataColumn(
            label: Text(dailyinfoheadername),
          ))
      .toList();

  List<DataRow> getRows(List<DailyInfoData> dailyinfodata) => dailyinfodata
      .map((DailyInfoData dailyinfodataname) => DataRow(
              selected: selecteddailyinfodata.contains(dailyinfodataname),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selecteddailyinfodata.add(dailyinfodataname)
                        : selecteddailyinfodata.remove(dailyinfodataname);
                  }),
              cells: [
                DataCell(Text(dailyinfodataname.entry)),
                DataCell(Text(dailyinfodataname.exitdate)),
                DataCell(Text(dailyinfodataname.receipt)),
                DataCell(Text(dailyinfodataname.emm11no)),
                DataCell(Text(dailyinfodataname.vehicle)),
                DataCell(Text(dailyinfodataname.vehicletype)),
                DataCell(Text(dailyinfodataname.drivername)),
                DataCell(Text(dailyinfodataname.contactno)),
                DataCell(Text(dailyinfodataname.destination)),
                DataCell(Text(dailyinfodataname.quantity)),
              ]))
      .toList();
}

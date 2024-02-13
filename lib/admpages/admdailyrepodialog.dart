import 'package:desktop_app1/model/dailyreport.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class AdmDailyRepoDialog extends StatefulWidget {
  const AdmDailyRepoDialog({super.key});

  @override
  State<AdmDailyRepoDialog> createState() => _AdmDailyRepoDialogState();
}

class _AdmDailyRepoDialogState extends State<AdmDailyRepoDialog> {
  final dailyrepoheader = [
    'Vehicle Type',
    'Entry Count',
    'Exit Count',
  ];
  List<DailyReport> selecteddailyrepodata = [];

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Container(
        height: 30.0,
        decoration: BoxDecoration(
          color: AppColor.colorprimary,
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Icon(Icons.local_shipping, size: 25.0, color: AppColor.colorwhite),
            const SizedBox(width: 5.0),
            Text(
              "Daily Reports",
              style: TextStyle(
                  color: AppColor.colorwhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: AppColor.colorwhite,
                  child: Icon(
                    Icons.close,
                    color: AppColor.colorprimary,
                    size: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      content: Container(
        height: 500,
        width: 550,
        decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: AppColor.colorprimary),
        ),
        child: Column(children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            height: 454,
            width: 550,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: AppColor.colorblack),
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
                          columnSpacing: 115,
                          headingRowHeight: 40.0,
                          dataRowHeight: 25.0,
                          headingTextStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: AppColor.colorblack),
                          dataTextStyle: TextStyle(
                              fontSize: 12.0, color: AppColor.colorblack),
                          columns: getColumns(dailyrepoheader),
                          rows: getRows(dailyreportdata)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> dailyrepoheader) => dailyrepoheader
      .map((String passcolumn) => DataColumn(
            label: Text(passcolumn),
          ))
      .toList();

  List<DataRow> getRows(List<DailyReport> dailyreportdata) => dailyreportdata
      .map((DailyReport dailyreportdata) => DataRow(
              selected: selecteddailyrepodata.contains(dailyreportdata),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selecteddailyrepodata.add(dailyreportdata)
                        : selecteddailyrepodata.remove(dailyreportdata);
                  }),
              cells: [
                DataCell(Text(dailyreportdata.vehicletype)),
                DataCell(Text(dailyreportdata.entrycount)),
                DataCell(Text(dailyreportdata.exitcount)),
              ]))
      .toList();
}

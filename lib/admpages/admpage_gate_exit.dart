import 'package:desktop_app1/model/exitrecord.dart';
import 'package:flutter/material.dart';

import '../customwidget/custom_icon_btn.dart';
import '../utils/color.dart';
import 'admdailyrepodialog.dart';

class AdmPageGateExit extends StatefulWidget {
  const AdmPageGateExit({super.key});

  @override
  State<AdmPageGateExit> createState() => _AdmPageGateExitState();
}

class _AdmPageGateExitState extends State<AdmPageGateExit> {
  TextEditingController controllerSearchQuery = TextEditingController();
  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  final exitheader = [
    'eMM11 No',
    'Receipt No',
    'Driver Name',
    'Vehicle Type',
    'Vehicle Number',
    'Entry Date',
    'Entry Time',
    'Exit Date',
    'Exit Time',
    'Loading Type',
    'Material Qty',
  ];
  List<ExitRecord> selectedexitdata = [];
  
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var minsize = 900;
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
          // heading part
          SizedBox(
            height: 50.0,
            child: Row(children: [
              const SizedBox(width: 20.0),
              const Text(
                "Vehicle No :  ",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 30.0,
                width: 300,
                child: TextFormField(
                  controller: controllerSearchQuery,
                  decoration: const InputDecoration(
                    hintText: "SEARCH",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 6.0)
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
              const Spacer(),
              CustomIconBtn(
                ontap: () {
                  debugPrint("delete a record Button clicked");
                },
                icon: Icons.close
              ),
              const SizedBox(width: 40.0),
              CustomIconBtn(
                ontap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context, 
                    builder: (context) {
                      return const AdmDailyRepoDialog();
                    }
                  );
                  debugPrint("Daily Report Button clicked");
                },
                icon: Icons.local_shipping
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
          // Exit Record Heading and lining
          Row(children: [
            const SizedBox(width: 5.0),
            const Text(
              "Exit Record ",
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
          const SizedBox(height: 3.0),
          // table data of exit record
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
                            columnSpacing: minsize > 925 ? 145.5 : 53,
                            headingRowHeight: 40.0,
                            dataRowHeight: 25.0,
                            headingTextStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorblack),
                            dataTextStyle: TextStyle(
                                fontSize: 12.0, color: AppColor.colorblack),
                            columns: getColumns(exitheader),
                            rows: getRows(exitdata)),
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
  List<DataColumn> getColumns(List<String> exitheader) => exitheader
      .map((String exitcolumn) => DataColumn(
            label: Text(exitcolumn),
          ))
      .toList();

  List<DataRow> getRows(List<ExitRecord> exitdata) => exitdata
      .map((ExitRecord exitrowdata) => DataRow(
              selected: selectedexitdata.contains(exitrowdata),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selectedexitdata.add(exitrowdata)
                        : selectedexitdata.remove(exitrowdata);
                  }),
              cells: [
                DataCell(Text(exitrowdata.emm11no)),
                DataCell(Text(exitrowdata.receiptno)),
                DataCell(Text(exitrowdata.drivername)),
                DataCell(Text(exitrowdata.vehicletype)),
                DataCell(Text(exitrowdata.vehiclenumber)),
                DataCell(Text(exitrowdata.entrydate)),
                DataCell(Text(exitrowdata.entrytime)),
                DataCell(Text(exitrowdata.exitdate)),
                DataCell(Text(exitrowdata.exittime)),
                DataCell(Text(exitrowdata.loadingtype)),
                DataCell(Text(exitrowdata.materialqty))
              ]))
      .toList();
}
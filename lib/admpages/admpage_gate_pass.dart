import 'package:desktop_app1/model/passdetails.dart';
import 'package:flutter/material.dart';

import '../customwidget/custom_icon_btn.dart';
import '../utils/color.dart';

class AdmPageGatePass extends StatefulWidget {
  const AdmPageGatePass({super.key});

  @override
  State<AdmPageGatePass> createState() => _AdmPageGatePassState();
}

class _AdmPageGatePassState extends State<AdmPageGatePass> {
  
  TextEditingController controllerSearchQuery = TextEditingController();

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  
  final passheader = [
    'Receipt No',
    'Vehicle No',
    'Vehicle Type',
    'Driver',
    'Contact No',
    'License No',
    'Destination',
    'Quantiy',
    'Loading Type',
    'Entry Date',
    'Entry Time',
    'Weight (Unloaded)',
  ];
  List<PassDetails> selectedpassdata = [];

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
        children: <Widget> [

          SizedBox(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Vehicle Number :   ",style: TextStyle(fontSize: 16.0),),
                SizedBox(
                  height: 30.0,
                  width: 300.0,
                  child: TextFormField(
                    controller: controllerSearchQuery,
                    decoration: const InputDecoration(
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
              ],
            ),
          ),
          Row(children: [
            const SizedBox(width: 10.0),
            const Text("Pass Details ",style: TextStyle(fontSize: 14.0)),
            Expanded(
              child: Container(
                height: 0.5,
                color: AppColor.colorgrey,
              ),
            )
          ],),
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
                            dataRowHeight: 25.0,
                            headingTextStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorblack),
                            dataTextStyle: TextStyle(
                                fontSize: 12.0, color: AppColor.colorblack),
                            columns: getColumns(passheader),
                            rows: getRows(passdata)),
                      ),
                    ),
                  ],
                ),
            ),
          )



      ]),
    );
  }
  List<DataColumn> getColumns(List<String> passheader) => passheader
      .map((String passcolumn) => DataColumn(
            label: Text(passcolumn),
          ))
      .toList();

  List<DataRow> getRows(List<PassDetails> empdata) => empdata
      .map((PassDetails passrowdata) => DataRow(
              selected: selectedpassdata.contains(passrowdata),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selectedpassdata.add(passrowdata)
                        : selectedpassdata.remove(passrowdata);
                  }),
              cells: [
                DataCell(Text(passrowdata.receiptno.toString())),
                DataCell(Text(passrowdata.vehiclno)),
                DataCell(Text(passrowdata.vehicletype)),
                DataCell(Text(passrowdata.driver)),
                DataCell(Text(passrowdata.contactno)),
                DataCell(Text(passrowdata.licenseno)),
                DataCell(Text(passrowdata.destination)),
                DataCell(Text(passrowdata.quantity.toString())),
                DataCell(Text(passrowdata.loadingtype)),
                DataCell(Text(passrowdata.entrydate)),
                DataCell(Text(passrowdata.entrytime)),
                DataCell(Text(passrowdata.weightunloaded.toString())),
              ]))
      .toList();
}
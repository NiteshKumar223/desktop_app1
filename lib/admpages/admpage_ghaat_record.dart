import 'package:desktop_app1/admpages/admdialog_form.dart';
import 'package:desktop_app1/model/ghaatdata.dart';
import 'package:desktop_app1/utils/color.dart';
import 'package:flutter/material.dart';

import '../customwidget/custom_icon_btn.dart';

class AdmPageGhaatRecord extends StatefulWidget {
  const AdmPageGhaatRecord({super.key});

  @override
  State<AdmPageGhaatRecord> createState() => _AdmPageGhaatRecordState();
}

class _AdmPageGhaatRecordState extends State<AdmPageGhaatRecord> {
  bool onhoveradd = false;
  bool onhoveredit = false;
  bool onhoverdel = false;
  bool isHover = false;

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  final ghaatheader = [
    'Site Type',
    'Site Name',
    'Site Lessee',
    'Material Type',
    'Registration',
    'Old Registration',
    'Activated'
  ];
  List<GhaatData> selectedghaatdata = [];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var minsize = screensize.width;
    return Container(
      margin: const EdgeInsets.only(top: 5.0, right: 5.0, bottom: 5.0),
      height: screensize.height,
      width: screensize.width,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppColor.colorgrey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(children: <Widget>[
        // top three buttons
        SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconBtn(
                  ontap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const AdmDialogForm();
                        });
                    debugPrint("add ghat detail Button clicked");
                  },
                  icon: Icons.add_box_rounded),
              const SizedBox(width: 60.0),
              CustomIconBtn(
                  ontap: () {
                    debugPrint("edit Button clicked");
                  },
                  icon: Icons.edit),
              const SizedBox(width: 60.0),
              CustomIconBtn(
                  ontap: () {
                    debugPrint("delete Button clicked");
                  },
                  icon: Icons.delete),
            ],
          ),
        ),
        // Ghaat Details Text
        Row(
          children: [
            const Text("  Ghaat Details ", style: TextStyle(fontSize: 14.0)),
            Expanded(
              child: Container(
                height: 0.5,
                color: AppColor.colorgrey,
              ),
            )
          ],
        ),
        const SizedBox(height: 5.0),
        // Table Data From Here
        Container(
          height: screensize.height - 132,
          width: screensize.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.colorgrey),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Column(children: <Widget>[
            SizedBox(
              height: screensize.height - 134,
              width: screensize.width,
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
                            columnSpacing: minsize > 925 ? 136.5 : 33.6,
                            headingRowHeight: 40.0,
                            dataRowHeight: 30.0,
                            headingTextStyle: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColor.colorblack),
                            dataTextStyle: TextStyle(
                                fontSize: 12.0, color: AppColor.colorblack),
                            columns: getColumns(ghaatheader),
                            rows: getRows(ghaatdata)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        )
      ]),
    );
  }

  List<DataColumn> getColumns(List<String> ghaatheader) => ghaatheader
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<GhaatData> ghaatdata) => ghaatdata
      .map((GhaatData ghdata) => DataRow(
              selected: selectedghaatdata.contains(ghdata),
              onSelectChanged: (isSelected) => setState(() {
                    final isAdding = isSelected != null && isSelected;

                    isAdding
                        ? selectedghaatdata.add(ghdata)
                        : selectedghaatdata.remove(ghdata);
                  }),
              cells: [
                DataCell(Text(ghdata.sitetype)),
                DataCell(Text(ghdata.sitename)),
                DataCell(Text(ghdata.sitelessee)),
                DataCell(Text(ghdata.materialtype)),
                DataCell(Text(ghdata.registration)),
                DataCell(Text(ghdata.oldregistration)),
                DataCell(Text(ghdata.activated)),
              ]))
      .toList();
}

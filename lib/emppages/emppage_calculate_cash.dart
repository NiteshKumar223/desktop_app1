import 'package:desktop_app1/customwidget/custom_icon_btn.dart';
import 'package:desktop_app1/model/calculatecash.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/color.dart';

class EmpPageCalculateCash extends StatefulWidget {
  const EmpPageCalculateCash({super.key});

  @override
  State<EmpPageCalculateCash> createState() => _EmpPageCalculateCashState();
}

class _EmpPageCalculateCashState extends State<EmpPageCalculateCash> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  bool isHover = false;

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();
  

  final calculatecashheader = [
    'Vehicle Type',
    'Count',
    'Quantity (In Ton)',
    'Value',
    'Total Cash'
  ];
  List<CalculateCash> selectedcalcashdata = [];

  var showContainer;
  @override
  void initState() {
    showContainer = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var minsize = screensize.width;
    var minsize1 = screensize.height;

    // First page
    Widget firstContainer = SizedBox(
      height: screensize.height - 58,
      width: screensize.width,
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: screensize.width,
            decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10.0),
                const Text("From : 46 - 48 ", style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 30.0,
                  width: 180.0,
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 14.0),
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                const SizedBox(width: 15.0),
                const Text("To : 46 - 48 ", style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 30.0,
                  width: 180.0,
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 14.0),
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                const SizedBox(width: 14.0),
                CustomIconBtn(
                  icon: Icons.search, 
                  ontap: (){

                  },
                ),
                SizedBox(width: minsize>925? 150 : 10.0),
                CustomIconBtn(
                  icon: Icons.arrow_forward, 
                  ontap: () {
                    setState(() {
                      showContainer = false;
                    });
                  },
                ),
                
              ],
            ),
          ),
          Row(
            children: [
              const Text(" Calculation Box ", style: TextStyle(fontSize: 14.0)),
              Expanded(
                child: Container(
                height: 0.5,
                color: AppColor.colorgrey,
                ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Container(
            height: minsize1 - 250,
            width: screensize.width,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Scrollbar(
              controller: horizontalScroll,
              thumbVisibility: true,
              trackVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: horizontalScroll,
                children: [
                  Scrollbar(
                    controller: verticalScroll,
                    thumbVisibility: true,
                    trackVisibility: true,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: verticalScroll,
                      child: DataTable(
                        border:
                            TableBorder.all(width: 0.3, color: AppColor.colorgrey),
                        columnSpacing: minsize > 925 ? 255.5 : 101,
                        headingRowHeight: 35.0,
                        dataRowHeight: 30.0,
                        headingTextStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.colorblack),
                        dataTextStyle:
                            TextStyle(fontSize: 12.0, color: AppColor.colorblack),
                        columns: getColumns(calculatecashheader),
                        
                        rows: getRowsFirst(calculatecashfirst)
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 118,
            width: screensize.width,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Total Vehicle Count: - ",
                      style: TextStyle(fontSize: 16.0)),
                  const SizedBox(width: 120.0),
                  OutlinedButton(
                    onPressed: () {},
                    onHover: (value) {
                      setState(() {
                        isHover = value;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.0, color: AppColor.colorprimary),
                        backgroundColor: isHover
                            ? AppColor.colorprimary
                            : AppColor.colorwhite),
                    child: isHover
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 27, right: 27, top: 10, bottom: 9),
                            child: Icon(
                              Icons.currency_rupee_outlined,
                              color: AppColor.colorwhite,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 27, right: 27, top: 10, bottom: 9),
                            child: Icon(
                              Icons.currency_rupee_outlined,
                              color: AppColor.colorprimary,
                            )
                            ),
                  ),
                  const SizedBox(width: 70.0),
                  const Text(
                    "Total:  Rs 0",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget secondContainer = SizedBox(
      height: screensize.height - 58,
      width: screensize.width,
      child: Column(
        children: [
          Container(
              height: 50.0,
              width: screensize.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   CustomIconBtn(
                  icon: Icons.arrow_back, 
                  ontap: () {
                    setState(() {
                      showContainer = true;
                    });
                  },
                ),
                  SizedBox(width: minsize>925? 150 : 10.0),
                  const Text("From :  ", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 30.0,
                    width: 260.0,
                    child: TextFormField(
                      controller: fromdate,
                      // initialValue: "date from",
                      onTap: () async {
                        DateTime? frompicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (frompicked != null) {
                          setState(() {
                            fromdate.text = DateFormat('EEEE ,  MMM  d ,  yyyy')
                                .format(frompicked);
                          });
                        }
                      },

                      decoration: const InputDecoration(
                          hintText: "Select From Date",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      style: const TextStyle(fontSize: 14.0),
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text("To :  ", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 30.0,
                    width: 260.0,
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
                            todate.text = DateFormat('EEEE ,  MMM  d ,  yyyy')
                                .format(topicked);
                          });
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Select To Date",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      style: const TextStyle(fontSize: 14.0),
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  CustomIconBtn(
                    icon: Icons.search, 
                    ontap: (){
                      
                    },
                  )
                ],
              )
            ),
          Row(
            children: [
              const Text(" Calculation Box ", style: TextStyle(fontSize: 14.0)),
              Expanded(
                child: Container(
                height: 0.5,
                color: AppColor.colorgrey,
                          ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Container(
            height: minsize1 - 250,
            width: screensize.width,
            decoration: BoxDecoration(
              border: Border.all(),
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
                        border:
                            TableBorder.all(width: 0.3, color: AppColor.colorgrey),
                        columnSpacing: minsize > 925 ? 255.5 : 101,
                        headingRowHeight: 35.0,
                        dataRowHeight: 30.0,
                        headingTextStyle: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: AppColor.colorblack),
                        dataTextStyle:
                            TextStyle(fontSize: 12.0, color: AppColor.colorblack),
                        columns: getColumns(calculatecashheader),
                       
                        rows: getRowsSecond(calculatecashsecond)
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 118,
            width: screensize.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Total Vehicle Count: - ",
                      style: TextStyle(fontSize: 16.0)),
                  const SizedBox(width: 120.0),
                  OutlinedButton(
                    onPressed: () {},
                    onHover: (value) {
                      setState(() {
                        isHover = value;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 2.0, color: AppColor.colorprimary),
                        backgroundColor: isHover
                            ? AppColor.colorprimary
                            : AppColor.colorwhite),
                    child: isHover
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 27, right: 27, top: 10, bottom: 9),
                            child: Icon(
                              Icons.currency_rupee_outlined,
                              color: AppColor.colorwhite,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 27, right: 27, top: 10, bottom: 9),
                            child: Icon(
                              Icons.currency_rupee_outlined,
                              color: AppColor.colorprimary,
                            )
                            ),
                  ),
                  const SizedBox(width: 70.0),
                  const Text(
                    "Total:  Rs 0",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          )



        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 5.0, bottom: 5.0),
      child: Container(
        height: screensize.height,
        width: screensize.width,
        decoration: BoxDecoration(
          color: AppColor.colorwhite,
          border: Border.all(width: 0.5, color: AppColor.colorgrey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            // Second Page
            if (showContainer) firstContainer else secondContainer,
          ],
        ),
      ),
    );
  }
  List<DataColumn> getColumns(List<String> calculatecashheader) => calculatecashheader
      .map((String calcashheadername) => DataColumn(
            label: Text(calcashheadername),
          ))
      .toList();

  List<DataRow> getRowsFirst(List<CalculateCash> calculatecashfirst) => calculatecashfirst
      .map((CalculateCash calcashdataname) => DataRow(
          selected: selectedcalcashdata.contains(calcashdataname),
    onSelectChanged: (isSelected) => setState(() {
      final isAdding = isSelected != null && isSelected;

      isAdding
          ? selectedcalcashdata.add(calcashdataname)
          : selectedcalcashdata.remove(calcashdataname);
    }),
        
        cells: [
            DataCell(Text(calcashdataname.vehicletype)),
            DataCell(Text(calcashdataname.count)),
            DataCell(Text(calcashdataname.quantityinton)),
            DataCell(Text(calcashdataname.value)),
            DataCell(Text(calcashdataname.totalcash)),
          ]))
      .toList();

  List<DataRow> getRowsSecond(List<CalculateCash> calculatecashsecond) => calculatecashsecond
      .map((CalculateCash calcashdataname) => DataRow(
          selected: selectedcalcashdata.contains(calcashdataname),
    onSelectChanged: (isSelected) => setState(() {
      final isAdding = isSelected != null && isSelected;

      isAdding
          ? selectedcalcashdata.add(calcashdataname)
          : selectedcalcashdata.remove(calcashdataname);
    }),
        
        cells: [
            DataCell(Text(calcashdataname.vehicletype)),
            DataCell(Text(calcashdataname.count)),
            DataCell(Text(calcashdataname.quantityinton)),
            DataCell(Text(calcashdataname.value)),
            DataCell(Text(calcashdataname.totalcash)),
          ]))
      .toList();
}


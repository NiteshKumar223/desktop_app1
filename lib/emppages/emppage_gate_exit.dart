import 'package:desktop_app1/customwidget/custom_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import '../customwidget/search_widget.dart';
import '../utils/color.dart';

class EmpPageGateExit extends StatefulWidget {
  const EmpPageGateExit({super.key});

  @override
  State<EmpPageGateExit> createState() => _EmpPageGateExitState();

  
}

class _EmpPageGateExitState extends State<EmpPageGateExit> {
  var query = '';
  bool isHover = false;
    bool isHover1 = false;
    TextEditingController exitdate = TextEditingController();
    TextEditingController exittime = TextEditingController();
    TextEditingController slipcontrol = TextEditingController();
    TextEditingController emptycontrol = TextEditingController();
    TextEditingController includinggoodscontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size1 = MediaQuery.of(context).size;

    return Container(
      height: size1.height - 47,
      width: size1.width - 205,
      margin: const EdgeInsets.only(top: 5.0,right: 5.0,bottom: 5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: AppColor.colorgrey),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Container...
              SizedBox(
                width: size1.width / 2 - 150,
                height: size1.height * 0.65,
              //  color: Colors.red,
                child: Column(
                  children: [
                    // This is left side row...Widget
                    // Search field.
                    Row(
                      children: [
                        // Here Add search field....
      
                        Expanded(child: buildSearch()),
                        // Here Add search button...
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.colorprimary, width: 2),
                              ),
                              margin: const EdgeInsets.only(top: 6),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.travel_explore_outlined,
                                  color: AppColor.colorprimary,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    // Next ...
                    // free space..
                    Container(
                      margin: const EdgeInsets.all(9.0),
                      //color: Colors.lightBlue[50],
                    )
                  ],
                ),
              ),
      
              // Right Container...
              SizedBox(
                width: size1.width / 2 - 55,
                height: size1.height * 0.65,
                // margin: EdgeInsets.only(left: 45),
                //color: Colors.yellow,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // This is right side row...Widget
                      // search filed.
                      SafeArea(
                        child: Row(
                          children: [
                            // Here Add search field....
                        
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, left: 28),
                              child: SizedBox(
                                width: size1.width * 0.35,
                                height: 60,
                                child: buildSearch(),
                              ),
                            ),
                            // Here Add search buttons...
                            InkWell(
                              onTap: () {
                                
                              },
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.colorprimary, width: 2),
                                ),
                                margin: const EdgeInsets.only(top: 6),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: AppColor.colorprimary,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        
                      // Add here collection text widgets...
                      const CollectionOfTextWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
      
          // Bottom Container....
          SizedBox(
            //color: Colors.grey,
            width: size1.width,
            height: size1.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  rowOne, // Add
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Exit Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Add here data time field
                      SizedBox(
                        height: 30.0,width: 260.0,
                        child: TextFormField(
                          controller: exitdate,
                          onTap: ()async{
                            DateTime? exitpicked =await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if(exitpicked != null){
                                setState((){
                                  exitdate.text = DateFormat('EEEE ,  MMM  d ,  yyyy').format(exitpicked);
                                });
                              }
                          }, 
                          decoration: const InputDecoration(
                            hintText: "Select Exit Date",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.arrow_drop_down)
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                      
                      const SizedBox(width: 20),
                      const Text(
                        'Exit Time : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Add timer calender fields..2 (1 for min and 2 for sec)
                      SizedBox(
                        height: 30.0,width: 130.0,
                        child: TextFormField(
                          controller: exittime,
                          onTap: ()async{
                            TimeOfDay? exitpickedtime =await showTimePicker(
                              context: context, 
                              initialTime: TimeOfDay.now(), 
                             
                            );
                            if(exitpickedtime != null){
                                setState((){
                                  exittime.text = exitpickedtime.format(context);
                                });
                              }
                          }, 
                          decoration: const InputDecoration(
                            hintText: "Select Exit Time",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.arrow_drop_down)
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 2.5,
                  children: [
                    const Text(
                      'Load Slip: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 140,
                      height: 30,
                      child: TextField(
                        controller: slipcontrol,
                        cursorColor: AppColor.colorprimary,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    const Text(
                      'Vehicle Weight (empty) : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: emptycontrol,
                        cursorColor: AppColor.colorprimary,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    const Text(
                      'kg',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Vehicle Weight (including goods) : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: TextField(
                        controller: includinggoodscontrol,
                        cursorColor: AppColor.colorprimary,
                        style: const TextStyle(height: 0.9),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    const Text(
                      'kg',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 2.5),
                Row(
                  children: [
                    const SizedBox(width:180.0),
                    const Text(
                      'eMM11 No : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    // Save Button...
                    OutlinedButton(
                      onPressed: () {},
                      onHover: (value) {
                        setState(() {
                          isHover1 = value;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(120, 35),
                          side: BorderSide(
                              width: 2.0, color: AppColor.colorprimary),
                          backgroundColor: isHover1
                              ? AppColor.colorprimary
                              : AppColor.colorwhite),
                      child: isHover1
                          ? const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 25, top: 5.0, bottom: 9),
                              child: Icon(
                                Icons.play_circle_rounded,
                                color: Colors.white,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(width: 30.0),
                    //Record Button..
                    OutlinedButton(
                      onPressed: () {
                
                      },
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(120, 35),
                          side: BorderSide(
                              width: 2.0, color: AppColor.colorprimary),
                          backgroundColor:
                              isHover ? AppColor.colorprimary : Colors.white),
                      child: isHover
                          ? const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 25, top: 5.0, bottom: 9),
                              child: Icon(
                                Icons.receipt,
                                color: Colors.white,
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Record",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(width: 180.0),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

 

  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: search,
        hintText: '',
      );

  // query search field....
  void search(String query) {}
}

// Collection Text Widget Here Available..

class CollectionOfTextWidget extends StatelessWidget {
  const CollectionOfTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Title(
            color: Colors.black,
            child: const Text(
              'Gate Pass Details',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        //1.
        CustomLabelAndTextfiled(
          label: 'Name of Ghaat',
          value: '',
        ),
        const SizedBox(height: 10),
        //2.
        CustomLabelAndTextfiled(
          label: 'Ghaat Contractor',
          value: '',
        ),
        const SizedBox(height: 10),
        //3.
        CustomLabelAndTextfiled(
          label: 'Receipt number',
          value: '',
        ),
        const SizedBox(height: 10),
        //4.
        CustomLabelAndTextfiled(
          label: 'Entry Date',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Entry Time',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Driver Name',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Mobile Number',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Vehicle Number',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Vehicle Type',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Driver Licence',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Material Quantity',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Loading Type',
          value: '',
        ),
        const SizedBox(height: 10),
        CustomLabelAndTextfiled(
          label: 'Destination Place',
          value: '',
        ),
        //SizedBox(height: 12),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomLabelAndTextfiled extends StatelessWidget {
  String label, value;
  CustomLabelAndTextfiled({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$label :   ',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> list = <String>[
  'AM',
  'PM',
];

  


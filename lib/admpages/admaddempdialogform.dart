

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../customwidget/custom_formfield.dart';
import '../utils/color.dart';

const List<String> sitetype = <String>[
  'SELECT SITE',
  'SELECT SITE (TEST LESSEE)',
];
const List<String> idtype = <String>[
  '--Select ID--',
  'PAN CARD',
  'AADHAR CARD',
  'DRIVING LICENSE',
  'PASSPORT'
];

class AdmAddEmpDialogForm extends StatefulWidget {
  const AdmAddEmpDialogForm({super.key});

  @override
  State<AdmAddEmpDialogForm> createState() => _AdmAddEmpDialogFormState();
}

class _AdmAddEmpDialogFormState extends State<AdmAddEmpDialogForm> {

  String dropdownsitetype = sitetype.first;
  String dropdownidtype = idtype.first;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerBankAcc = TextEditingController();
  TextEditingController controllerDesig = TextEditingController();
  TextEditingController controllerBankIfsc = TextEditingController();
  TextEditingController controllerPriCont = TextEditingController();
  TextEditingController controllerSecCont = TextEditingController();
  TextEditingController controllerIdNumber = TextEditingController();
  TextEditingController controllerSalary = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerJoiningdate = TextEditingController();

  String? loginType;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
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
            Icon(Icons.people,size: 30.0,color: AppColor.colorwhite),
            const SizedBox(width: 5.0),
            Text(
              "Employee Details",
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
        height: 525,
        width: 750,
        decoration: BoxDecoration(
          border: Border.all(width: 3.0,color: AppColor.colorprimary)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text("Project Name* :  "),
              Container(
                height: 30.0,
                width: 500.0,
                 padding: const EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5,color: AppColor.colorgrey)
                ),
                child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownsitetype,
                      focusColor: AppColor.colorwhite,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 8,
                      style: TextStyle(color: AppColor.colorblack),
                      underline: Container(
                        height: 0.0,
                        color: AppColor.colorblack,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownsitetype = value!;
                        });
                      },
                      items:
                          sitetype.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
              ),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Name*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerName,
                  ),
                ),
                const SizedBox(width: 20.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Bank Account:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerBankAcc,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Designation*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerDesig,
                  ),
                ),
                const SizedBox(width: 20.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Bank IFS Code:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerBankIfsc,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Pri Contact*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerPriCont,
                  ),
                ),
                const SizedBox(width: 20.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Id Type*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  height: 30,
                  width: 220,
                  padding: const EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5,color: AppColor.colorgrey),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownidtype,
                        focusColor: AppColor.colorwhite,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 8,
                        style: TextStyle(color: AppColor.colorblack),
                        underline: Container(
                          height: 0.0,
                          color: AppColor.colorblack,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownidtype = value!;
                          });
                        },
                        items:
                            idtype.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Sec Contact:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerSecCont,
                  ),
                ),
                const SizedBox(width: 20.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Id Number*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerIdNumber,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Salary:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: CustomFormField(
                    textController: controllerSalary,
                  ),
                ),
                const SizedBox(width: 20.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Date of Joining:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 220,
                  child: TextFormField(
                      controller: controllerJoiningdate,
                      onTap: () async {
                        DateTime? topicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (topicked != null) {
                          setState(() {
                            controllerJoiningdate.text = DateFormat('EEEE, MMM d, yyyy')
                                .format(topicked);
                          });
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: "Select Joining Date",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      style: const TextStyle(fontSize: 11.0),
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 13.0),
                const SizedBox(
                  height: 30,
                  width: 130,
                  child: Text(
                    "Address:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 220,
                  child: TextFormField(
                    controller: controllerAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),

                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      // contentPadding: EdgeInsets.only(bottom: 33),
                      title: const Text("Login (Entry)",style: TextStyle(fontSize: 13),),
                      value: "login_entry",
                      groupValue: loginType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          loginType = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("Login (Exit)",style: TextStyle(fontSize: 13)),
                      value: "login_exit",
                      groupValue: loginType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          loginType = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("Login (Both)",style: TextStyle(fontSize: 13)),
                      value: "login_both",
                      groupValue: loginType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          loginType = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("No login",style: TextStyle(fontSize: 13)),
                      value: "no_login",
                      groupValue: loginType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          loginType = value.toString();
                        });
                      },
                    ),
                  ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
              onPressed: () {
        
              },
              onHover: (value) {
                setState(() {
                  isHover = value;
                });
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: AppColor.colorprimary),
                  backgroundColor:
                      isHover ? AppColor.colorprimary : AppColor.colorwhite),
              child: isHover
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 28, right: 28, top: 10, bottom: 9),
                      child: Icon(
                        Icons.play_circle,
                        color: AppColor.colorwhite,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 19, right: 20, top: 8, bottom: 8),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorprimary,
                        ),
                      ),
                    ),
            ),
                const SizedBox(width: 15.0),
              ],
            )
        ]),
      ),
    ); 
  }
}
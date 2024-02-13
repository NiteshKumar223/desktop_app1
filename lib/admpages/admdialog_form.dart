import 'package:flutter/material.dart';

import '../customwidget/custom_formfield.dart';
import '../utils/color.dart';

const List<String> sitetype = <String>[
  'SELECT SITE TYPE',
  'LIVE SITE',
  'DUMP SITE'
];
const List<String> materialtype = <String>[
  'SELECT MATERIAL',
  'MATERIAL1',
  'MATERIAL2',
  'MATERIAL3',
  'MATERIAL4'
];

class AdmDialogForm extends StatefulWidget {
  const AdmDialogForm({super.key});

  @override
  State<AdmDialogForm> createState() => _AdmDialogFormState();
}

class _AdmDialogFormState extends State<AdmDialogForm> {
  String dropdownsitetype = sitetype.first;
  String dropdownmattype = materialtype.first;
  bool isHover = false;

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
            Image.asset("assets/images/digger4.png",
                height: 30, width: 30, color: AppColor.colorwhite),
            const SizedBox(width: 5.0),
            Text(
              "Site Details",
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
      content: SizedBox(
        height: 550,
        width: 850,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Site Type*:"),
                const SizedBox(width: 15.0),
                Container(
                  height: 30,
                  width: 350,
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.colorgrey, width: 0.5),
                    borderRadius: BorderRadius.circular(4.0),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(
                    "Site Name*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 550,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(
                    "Site Lessee Name*:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 550,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(
                    "Lessee Id**:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 550,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(
                    "Old Lessee Id**:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 550,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(
                    "Material Type:",
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  height: 30,
                  width: 550,
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.colorgrey, width: 0.5),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownmattype,
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
                        dropdownmattype = value!;
                      });
                    },
                    items:
                        materialtype.map<DropdownMenuItem<String>>((String value) {
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
                  width: 150,
                  child: Text(
                    "Site Address:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  // height:60,
                  width: 550,
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 30,
                    width: 150,
                    child: Text("For Dump Site Only* ")),
                Container(
                  height: 0.5,
                  width: 550,
                  color: AppColor.colorgrey,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  width: 140,
                  child: Text(
                    "Opening Stocks***:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 175,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 30),
                const SizedBox(
                  height: 30,
                  width: 180,
                  child: Text(
                    "Dum permitted Limit***:",
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 175,
                  child: CustomFormField(
                    textController: TextEditingController(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("*** in tons Only")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "** Please Enter Atleast 4 Digit From Start Of Lessee Id Number Of Ghaat/Dump"),
                const SizedBox(width: 50.0),
                OutlinedButton(
                  onPressed: () {},
                  onHover: (value) {
                    setState(() {
                      isHover = value;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      side:
                          BorderSide(width: 2.0, color: AppColor.colorprimary),
                      backgroundColor: isHover
                          ? AppColor.colorprimary
                          : AppColor.colorwhite),
                  child: isHover
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 27, right: 27, top: 10, bottom: 9),
                          child: Text(
                            "Save",
                            style: TextStyle(color: AppColor.colorwhite),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 27, right: 27, top: 10, bottom: 9),
                          child: Text(
                            "Save",
                            style: TextStyle(color: AppColor.colorprimary),
                          )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

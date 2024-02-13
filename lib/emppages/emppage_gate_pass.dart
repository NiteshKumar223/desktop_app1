import 'package:desktop_app1/utils/color.dart';
import 'package:flutter/material.dart';

import '../customwidget/custom_formfield.dart';

const List<String> matsupplylist = <String>['-SELECT-', 'MARKET', 'DUMP'];
const List<String> quantitylist = <String>[
  '-SELECT QUANTITY-',
  'CUBIC METER',
  'CUBIC FEET',
  'BUCKET'
];
const List<String> vantypelist = <String>[
  '-SELECT TYPE-',
  '6 WHILER',
  '8 WHILER',
  '12 WHILER'
];
const List<String> percentage = <String>['100%', '80%', '60%', '50%'];

class EmpPageGatePass extends StatefulWidget {
  const EmpPageGatePass({super.key});

  @override
  State<EmpPageGatePass> createState() => _EmpPageGatePassState();
}

class _EmpPageGatePassState extends State<EmpPageGatePass> {
  String dropdownMatSupply = matsupplylist.first;
  String dropdownQuantityType = quantitylist.first;
  String dropdownVanType = vantypelist.first;
  String percentAmount = percentage.first;
  String? loadingType;
  String? royalty;
  bool isHover = false;
  bool isHover1 = false;
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0),
      child: SizedBox(
        height: screensize.height,
        width: screensize.width,
        child: Column(
          children: [
            SizedBox(
              height: 49.0,
              width: screensize.width,
              // color: AppColor.colorprimarylight,
              child: const Center(
                child: Text(
                  "Gate Pass:",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              children: [
                const Text(" Pass Details: ", style: TextStyle(fontSize: 14.0)),
                Expanded(
                  child: Container(
                    height: 0.5,
                    // width: screensize.width - 308,
                    color: AppColor.colorgrey,
                  ),
                )
              ],
            ),
            Container(
              height: screensize.height - 125,
              width: screensize.width,
              decoration: BoxDecoration(
                  color: AppColor.colorwhite,
                  border: Border.all(width: 0.5, color: AppColor.colorgrey),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.colorprimary)),
                            child: Icon(Icons.refresh,
                                color: AppColor.colorprimary)
                            //Image.asset("assets/images/progress.png"),
                            ),
                      ),
                      const SizedBox(width: 100.0),
                      const Text("Material Supply:"),
                      const SizedBox(width: 20.0),
                      DropdownButton<String>(
                        value: dropdownMatSupply,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: AppColor.colorprimary),
                        underline: Container(
                          height: 1.0,
                          color: AppColor.colorblack,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownMatSupply = value!;
                          });
                        },
                        items: matsupplylist
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 10.0),
                      const Text("For"),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vehicle No:  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.colorprimary),
                          ),
                          child:
                              Icon(Icons.search, color: AppColor.colorprimary),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      const Text("vehicle weight (Empty):  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                      ),
                      const SizedBox(width: 10.0),
                      const Text("Kg"),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Mobile No:  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 235.0,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(width: 20.0),
                      const Text("Material Weight (tan):  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Driver's Name:  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text("Destination Place (District):  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Driver License:  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 200.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text("Loading Type:  "),
                      SizedBox(
                        height: 25,
                        width: 130,
                        child: Center(
                          child: RadioListTile(
                            title: const Text(
                              "Labour",
                              style: TextStyle(fontSize: 12),
                            ),
                            value: "labour",
                            groupValue: loadingType,
                            activeColor: AppColor.colorprimary,
                            onChanged: (value) {
                              setState(() {
                                loadingType = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 130,
                        child: Center(
                          child: RadioListTile(
                            title: const Text(
                              "Machine",
                              style: TextStyle(fontSize: 12),
                            ),
                            value: "machine",
                            groupValue: loadingType,
                            activeColor: AppColor.colorprimary,
                            onChanged: (value) {
                              setState(() {
                                loadingType = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vehicle Type:  "),
                      Container(
                        height: 25.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: AppColor.colorprimarylight,
                            border: Border.all(color: AppColor.colorgrey)),
                        child: DropdownButton<String>(
                          value: dropdownVanType,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: AppColor.colorprimary),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownVanType = value!;
                            });
                          },
                          items: vantypelist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      const Text("Mining Amount:  "),
                      CustomFormField(
                        textController: TextEditingController(),
                        width: 125.0,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        height: 25.0,
                        width: 155.0,
                        decoration: BoxDecoration(
                            color: AppColor.colorprimarylight,
                            border: Border.all(color: AppColor.colorgrey)),
                        child: DropdownButton<String>(
                          value: dropdownQuantityType,
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          style: TextStyle(color: AppColor.colorprimary),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownQuantityType = value!;
                            });
                          },
                          items: quantitylist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          onHover: (value) {
                            setState(() {
                              isHover = value;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(120, 35),
                              side: BorderSide(
                                  width: 2.0, color: AppColor.colorprimary),
                              backgroundColor: isHover
                                  ? AppColor.colorprimary
                                  : AppColor.colorwhite),
                          child: isHover
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 25, top: 5.0, bottom: 9),
                                  child: Icon(
                                    Icons.receipt,
                                    color: AppColor.colorwhite,
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
                        const SizedBox(width: 100),
                        const Text("Royalty:  "),
                        SizedBox(
                          height: 25,
                          width: 110,
                          child: Center(
                            child: RadioListTile(
                              title: const Text(
                                "Yes",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: "yes",
                              groupValue: royalty,
                              activeColor: AppColor.colorprimary,
                              onChanged: (value) {
                                setState(() {
                                  royalty = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 110,
                          child: Center(
                            child: RadioListTile(
                              title: const Text(
                                "No",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: "no",
                              groupValue: royalty,
                              activeColor: AppColor.colorprimary,
                              onChanged: (value) {
                                setState(() {
                                  royalty = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 100),
                        OutlinedButton(
                          onPressed: () {},
                          onHover: (value) {
                            setState(() {
                              isHover1 = value;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(120, 35),
                              side: BorderSide(
                                  width: 2.0, color: AppColor.colorprimary),
                              backgroundColor: isHover1
                                  ? AppColor.colorprimary
                                  : AppColor.colorwhite),
                          child: isHover1
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 25, top: 5.0, bottom: 9),
                                  child: Icon(
                                    Icons.play_circle_rounded,
                                    color: AppColor.colorwhite,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Pass Save",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                        ),
                      ]),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0),
                    child: Container(
                      height: screensize.height - 425,
                      width: screensize.width,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: AppColor.colorgrey),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Container(
                          height: 30.0,
                          width: screensize.width,
                          color: AppColor.colorgrey1,
                          child: Row(children: [
                            Tooltip(
                              message: "Print",
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(Icons.print,
                                      color: AppColor.colorgrey),
                                ),
                              ),
                            ),
                            Tooltip(
                              message: "Print Layout",
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(Icons.receipt,
                                      color: AppColor.colorgrey),
                                ),
                              ),
                            ),
                            Tooltip(
                              message: "Page Setup",
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(Icons.layers,
                                      color: AppColor.colorgrey),
                                ),
                              ),
                            ),
                            VerticalDivider(
                                thickness: 2.0, color: AppColor.colorgrey),
                            Container(
                              alignment: Alignment(0, 0),
                              height: 25.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  color: AppColor.colorgrey1,
                                  border:
                                      Border.all(color: AppColor.colorgrey)),
                              child: DropdownButton<String>(
                                value: percentAmount,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: TextStyle(color: AppColor.colorgrey),
                                onChanged: (String? value) {
                                  setState(() {
                                    percentAmount = value!;
                                  });
                                },
                                items: percentage.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                        ),
                        Text(
                          "The source of the report definition has not been specified",
                          style: TextStyle(color: AppColor.colorgrey),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

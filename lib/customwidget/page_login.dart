import 'package:desktop_app1/emppages/emppage_my_home.dart';
import 'package:desktop_app1/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../admpages/admpage_my_home.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: AppColor.colorprimary,
      //   flexibleSpace: MoveWindow(),
      //   title: const Padding(
      //     padding: EdgeInsets.only(left: 20, top: 50, bottom: 60),
      //     child: Text(
      //       "Login",
      //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      //       child: MinimizeWindowButton(
      //         colors: WindowButtonColors(
      //             normal: AppColor.colorprimary,
      //             iconNormal: AppColor.colorwhite,
      //             mouseOver: AppColor.colorwhite,
      //             mouseDown: AppColor.colorprimary,
      //             iconMouseOver: AppColor.colorprimary,
      //             iconMouseDown: AppColor.colorwhite),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      //       child: MaximizeWindowButton(
      //         colors: WindowButtonColors(
      //             normal: AppColor.colorprimary,
      //             iconNormal: AppColor.colorwhite,
      //             mouseOver: AppColor.colorwhite,
      //             mouseDown: AppColor.colorprimary,
      //             iconMouseOver: AppColor.colorprimary,
      //             iconMouseDown: AppColor.colorwhite),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      //       child: CloseWindowButton(
      //         colors: WindowButtonColors(
      //             normal: AppColor.colorprimary,
      //             iconNormal: AppColor.colorwhite,
      //             mouseOver: AppColor.colorwhite,
      //             mouseDown: AppColor.colorprimary,
      //             iconMouseOver: AppColor.colorprimary,
      //             iconMouseDown: AppColor.colorwhite),
      //       ),
      //     )
      //   ],
      // ),
      body: WindowBorder(
        width: 3.0,
        color: AppColor.colorprimary,
        child: Column(
          children: [
            Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              color: AppColor.colorprimary,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w200,
                        color: AppColor.colorwhite),
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 259,
                    height: 80,
                    child: MoveWindow(),
                  ),
                ),
                // const Spacer(flex: 3,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: MinimizeWindowButton(
                    colors: WindowButtonColors(
                        normal: AppColor.colorprimary,
                        iconNormal: AppColor.colorwhite,
                        mouseOver: AppColor.colorwhite,
                        mouseDown: AppColor.colorprimary,
                        iconMouseOver: AppColor.colorprimary,
                        iconMouseDown: AppColor.colorwhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: MaximizeWindowButton(
                    colors: WindowButtonColors(
                        normal: AppColor.colorprimary,
                        iconNormal: AppColor.colorwhite,
                        mouseOver: AppColor.colorwhite,
                        mouseDown: AppColor.colorprimary,
                        iconMouseOver: AppColor.colorprimary,
                        iconMouseDown: AppColor.colorwhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CloseWindowButton(
                    colors: WindowButtonColors(
                        normal: AppColor.colorprimary,
                        iconNormal: AppColor.colorwhite,
                        mouseOver: AppColor.colorwhite,
                        mouseDown: AppColor.colorprimary,
                        iconMouseOver: AppColor.colorprimary,
                        iconMouseDown: AppColor.colorwhite),
                  ),
                )
              ]),
            ),
            Expanded(
              child: Row(children: [
                const LoginLeftSide1(),
                VerticalDivider(
                  color: AppColor.colorprimary,
                  thickness: 2,
                ),
                const LoginRightSide1(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginLeftSide1 extends StatelessWidget {
  const LoginLeftSide1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage("assets/images/yog.PNG"),
              ),
            ),
            Text(
              "A",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "LMB",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Technologies",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            Text(
              "Product",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginRightSide1 extends StatefulWidget {
  const LoginRightSide1({super.key});

  @override
  State<LoginRightSide1> createState() => _LoginRightSide1State();
}

class _LoginRightSide1State extends State<LoginRightSide1> {
  String? loginType;
  String? serviceType;
  bool isHover = false;
  String hint = "Login(Enter)";

  @override
  Widget build(BuildContext context) {
    TextEditingController loginIdController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 15.0),
          child: Text(
            "Welcome...",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: AppColor.colorgrey),
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          height: 300.0,
          width: MediaQuery.of(context).size.width - 300,
          child: Column(children: [
            SizedBox(
              height: 35,
              width: 370,
              child: TextField(
                controller: loginIdController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Login Id',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 35,
              width: 370,
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                controller: passwordController,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '********',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login Type: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("Employee"),
                      value: "employee",
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
                      title: const Text("Admin"),
                      value: "admin",
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
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Service Type: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("Live Site"),
                      value: "live_site",
                      groupValue: serviceType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          serviceType = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 160,
                    child: RadioListTile(
                      title: const Text("Dump"),
                      value: "dump",
                      groupValue: serviceType,
                      activeColor: AppColor.colorprimary,
                      onChanged: (value) {
                        setState(() {
                          serviceType = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 50.0),
            OutlinedButton(
              onPressed: () {
                if (loginType == "employee" &&
                    (serviceType == "live_site" || serviceType == "dump")) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const EmpPageMyHome();
                  }));
                } else if (loginType == "admin" &&
                    (serviceType == "live_site" || serviceType == "dump")) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AdmPageMyHome();
                  }));
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          title: Container(
                            height: 30,
                            color: AppColor.colorprimary,
                            child: Row(children: [
                              const SizedBox(width: 5.0),
                              Icon(Icons.question_mark,
                                  size: 25, color: AppColor.colorwhite),
                              const SizedBox(width: 5.0),
                              Text("Something Wrong !",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.colorwhite)),
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
                            ]),
                          ),
                          content: Container(
                            height: 100,
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (loginType == null)
                                  const Text("Login Type Should Not be Null",
                                      style: TextStyle(color: Colors.red)),
                                if (serviceType == null)
                                  const Text("Service Type Should Not be Null",
                                      style: TextStyle(color: Colors.red)),
                                ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.colorprimary),
                                  child: const Text("OK"),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
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
                          left: 27, right: 27, top: 10, bottom: 9),
                      child: Icon(
                        Icons.play_circle,
                        color: AppColor.colorwhite,
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                      ),
                    ),
            )
          ]),
        )
      ],
    );
  }
}

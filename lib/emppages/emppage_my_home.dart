import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:desktop_app1/emppages/emppage_calculate_cash.dart';
import 'package:desktop_app1/emppages/emppage_daily_info.dart';
import 'package:desktop_app1/emppages/emppage_gate_pass.dart';
import 'package:desktop_app1/customwidget/page_login.dart';
import 'package:desktop_app1/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../customwidget/custom_formfield.dart';
import 'emppage_gate_exit.dart';

class EmpPageMyHome extends StatefulWidget {
  const EmpPageMyHome({super.key});

  @override
  State<EmpPageMyHome> createState() => _EmpPageMyHomeState();
}

class _EmpPageMyHomeState extends State<EmpPageMyHome> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColor.colorprimary,
      //   title: const Text(
      //     "CALCULATOR",
      //     style: TextStyle(
      //         fontSize: 25.0,
      //         color: Colors.white
      //       )
      //   ),
      // ),
      // drawer: MyDrawerPage(),
      body: WindowBorder(
        width: 3.0,
        color: AppColor.colorprimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              color: AppColor.colorprimary,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Ghaat Management",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: AppColor.colorwhite),
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 550,
                    height: 40,
                    child: MoveWindow(),
                  ),
                ),

                Text(
                  """WELCOME TEST EMP""",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: AppColor.colorwhite),
                ),
                SafeArea(
                  child: SizedBox(
                    width: 154,
                    height: 40,
                    child: MoveWindow(),
                  ),
                ),
                PopupMenuButton<int>(
                  // initialValue: 0,
                  icon: Icon(
                    Icons.settings,
                    color: AppColor.colorwhite,
                  ),
                  tooltip: "Profile (Escape)",
                  iconSize: 20.0,
                  shape: RoundedRectangleBorder(
                      side:
                          BorderSide(color: AppColor.colorprimary, width: 2.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  // splashRadius: 50,
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 0,
                        padding: const EdgeInsets.only(left: 8.0, right: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_reset_outlined,
                              color: AppColor.colorprimary,
                              size: 30.0,
                            ),
                            const SizedBox(width: 10),
                            const Text('Change Password'),
                          ],
                        )),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                        value: 1,
                        padding: const EdgeInsets.only(left: 8.0, right: 2),
                        child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.red, size: 30.0),
                            SizedBox(width: 10),
                            Text('LogOut'),
                          ],
                        ))
                  ],
                ),
                MinimizeWindowButton(
                  colors: WindowButtonColors(
                      normal: AppColor.colorprimary,
                      iconNormal: AppColor.colorwhite,
                      mouseOver: AppColor.colorwhite,
                      mouseDown: AppColor.colorprimary,
                      iconMouseOver: AppColor.colorprimary,
                      iconMouseDown: AppColor.colorwhite),
                ),
                MaximizeWindowButton(
                  colors: WindowButtonColors(
                      normal: AppColor.colorprimary,
                      iconNormal: AppColor.colorwhite,
                      mouseOver: AppColor.colorwhite,
                      mouseDown: AppColor.colorprimary,
                      iconMouseOver: AppColor.colorprimary,
                      iconMouseDown: AppColor.colorwhite),
                ),
                // CloseWindowButton(
                //   colors: WindowButtonColors(
                //       normal: AppColor.colorprimary,
                //       iconNormal: AppColor.colorwhite,
                //       mouseOver: AppColor.colorwhite,
                //       mouseDown: AppColor.colorprimary,
                //       iconMouseOver: AppColor.colorprimary,
                //       iconMouseDown: AppColor.colorwhite),
                // )
              ]),
            ),

            // Content view from here
            Expanded(
              child: Row(
                children: [
                  Builder(builder: (context) {
                    final isSmallScreen =
                        MediaQuery.of(context).size.width < 800;
                    return SideBarWidget(controller: _controller);
                  }),
                  if (isSmallScreen) SideBarWidget(controller: _controller),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        switch (_controller.selectedIndex) {
                          case 0:
                            return const EmpPageGatePass();
                          case 1:
                            return const EmpPageGateExit();
                          case 2: 
                            return const EmpPageDailyInfo(loginValue: 'employee',);
                          case 3:
                            return const EmpPageCalculateCash();
                          default:
                            return const EmpPageDailyInfo(loginValue: 'employee',);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return passChangeDialog(context);
            });
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return const PageLogin();
        // }));
        break;
      case 1:
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return logoutConfirmDialog(context);
            });

        break;
    }
  }
}

logoutConfirmDialog(context) {
  return AlertDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    actionsAlignment: MainAxisAlignment.center,
    title: Container(
        height: 30.0,
        child: Row(
          children: [
            const SizedBox(width: 5.0),
            Text(
              "Quit",
              style: TextStyle(
                  color: AppColor.colorgrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: AppColor.colorwhite,
                  child: Icon(
                    Icons.close,
                    color: AppColor.colorgrey1,
                    size: 18.0,
                  ),
                ),
              ),
            )
          ],
        )),
    content: SizedBox(
      height: 90.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
            backgroundColor: Colors.blue.shade800,
            child: Icon(Icons.question_mark,
                color: AppColor.colorwhite, size: 30)),
        const SizedBox(width: 10.0),
        const Text("Are you sure to Exit ?"),
      ]),
    ),
    actions: [
      OutlinedButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const PageLogin();
          }));
        },
        child: Text("Yes",style: TextStyle(color: AppColor.colorblack),),
      ),
      const SizedBox(
        width: 10.0,
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("No",style: TextStyle(color: AppColor.colorblack),),
      )
    ],
  );
}

passChangeDialog(context) {
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
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.key, color: AppColor.colorwhite),
          ),
          const SizedBox(width: 5.0),
          Text(
            "Change Password",
            style: TextStyle(
                color: AppColor.colorwhite,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          MoveWindow(
            child: const SizedBox(
              height: 30.0,
              width: 450,
            ),
          ),
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
      height: 200,
      width: 600,
      child: Row(
        children: [
          Container(
            height: 200,
            width: 120,
            color: AppColor.colorgrey1,
            child: Icon(
              Icons.lock,
              size: 110,
              color: AppColor.colorprimary,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Wrap(
                children: [
                  const Text("Current Password *  "),
                  CustomFormField(
                    textController: TextEditingController(),
                    width: 340,
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Text("     New Password *  "),
                  CustomFormField(
                    textController: TextEditingController(),
                    width: 340,
                  ),
                ],
              ),
              Wrap(
                children: [
                  const Text("Confirm Password *  "),
                  CustomFormField(
                    textController: TextEditingController(),
                    width: 340,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const PageLogin();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.colorprimary,
                ),
                child: const Text("Submit"),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      headerBuilder: (context, extended) {
        return Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 13),
          child: Container(
              height: 100,
              width: 172,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.colorgrey, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Wrap(
                spacing: 2.0,
                runAlignment: WrapAlignment.center,
                children: [
                  const SizedBox(width: 8.0),
                  Icon(Icons.dashboard,
                      color: AppColor.colorprimary, size: 25.0),
                  const SizedBox(width: 8.0),
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.colorprimary),
                  ),
                ],
              )),
        );
      },
      footerDivider: Divider(thickness: 2.0,color: AppColor.colorprimary),
      theme: SidebarXTheme(
        width: 80,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(2.0),
        itemMargin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: AppColor.colorprimarylight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.colorgrey, width: 0.5)),
        hoverColor: AppColor.colorhover,
        textStyle: TextStyle(color: AppColor.colorprimary),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 10),
        selectedItemTextPadding: const EdgeInsets.only(left: 10),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.colorgrey, width: 0.5),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.colorprimary,
          ),
          gradient: LinearGradient(
            colors: [AppColor.colorprimarylight, Colors.green.shade500],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.colorblack.withOpacity(0.28),
              blurRadius: 5,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: AppColor.colorprimary,
          size: 25,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColor.colorprimary,
          size: 25,
        ),
      ),
      extendedTheme: SidebarXTheme(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(2.0),
        itemMargin: const EdgeInsets.all(2.0),
        width: 180,
        decoration: BoxDecoration(
            color: AppColor.colorwhite,
            border: Border.all(color: AppColor.colorgrey, width: 0.5),
            borderRadius: BorderRadius.circular(10.0)),
      ),
      items: const [
        SidebarXItem(icon: Icons.door_sliding, label: "Gate Pass"),
        SidebarXItem(icon: Icons.exit_to_app, label: "Gate Exit"),
        SidebarXItem(icon: Icons.info, label: "Daily Information"),
        SidebarXItem(icon: Icons.calculate_rounded, label: "Calculate Cash"),
      ],
    );
  }
}

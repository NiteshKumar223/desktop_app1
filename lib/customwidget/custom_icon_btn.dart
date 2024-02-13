

import 'package:flutter/material.dart';

import '../utils/color.dart';

class CustomIconBtn extends StatefulWidget {
  final IconData icon;
  final VoidCallback ontap;
  const CustomIconBtn({
    super.key, 
    required this.icon, 
    required this.ontap,
  });

  @override
  State<CustomIconBtn> createState() => _CustomIconBtnState();
}

class _CustomIconBtnState extends State<CustomIconBtn> {
  bool btnHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: widget.ontap,
                //(){},
                onHover: (value) {
                  btnHover = value;
                  setState(() { });
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                    color: btnHover
                      ?AppColor.colorprimary
                      :AppColor.colorwhite,
                    border: Border.all(color: AppColor.colorprimary,width: 1.5)
                  ),
                  child: Center(
                    child: 
                    Icon(
                      widget.icon,
                      color: btnHover
                        ?AppColor.colorwhite
                        :AppColor.colorprimary,  
                    ),
                  ),
                ),
              );
  }
}
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCenterWidget extends StatelessWidget {
  final CenterModel center;
  final void Function()? onTaped;
  const CustomCenterWidget({
    super.key,
    required this.center,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        height: 200.h,
        padding: EdgeInsets.all(10),

        width: double.infinity,
        child: GridTile(
          header: Text(center.name, style: TextStyles.font32BlueBold),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/institust.png')),
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

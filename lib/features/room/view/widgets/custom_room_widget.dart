import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoomWidget extends StatelessWidget {
  final Room room;
  final void Function()? onTaped;
  const CustomRoomWidget({
    super.key,
    required this.room,
    required this.onTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
      child: Container(
        height: 180.h,
        padding: EdgeInsets.all(10),

        child: Card(
          child: ListTile(
            title: Text("Room:${room.name}", style: TextStyles.font32BlueBold),
            subtitle: Text(
              'Teacher:${room.teacher?.name ?? 'No Teacher'}',
              style: TextStyles.font16WhiteMedium.copyWith(
                color: ColorsManager.darkBlue,
              ),
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

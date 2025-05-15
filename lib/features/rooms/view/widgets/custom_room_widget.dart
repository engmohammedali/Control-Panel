import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
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
        height: 200.h,
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightGray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.school,
                    color: ColorsManager.mainBlue,
                    size: 32.sp,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Room: ${room.name}",
                        style: TextStyles.font24BlackBold,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Teacher: ${room.teacher?.name ?? 'No Teacher'}',
                        style: TextStyles.font16WhiteMedium.copyWith(
                          color: ColorsManager.darkBlue,
                        ),
                      ),

                      Text(
                        'Count Students: ${room.students?.length ?? '0'}',
                        style: TextStyles.font14BlueSemiBold.copyWith(
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: onTaped,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: ColorsManager.mainBlue,
                    ),
                    tooltip: 'View Details',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

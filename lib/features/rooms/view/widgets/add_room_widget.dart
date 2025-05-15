import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:controlpanel/features/rooms/view/widgets/add_room_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRoomWidget extends StatefulWidget {
  final int instituteId;
  final int centerId;
  const AddRoomWidget({
    super.key,
    required this.instituteId,
    required this.centerId,
  });

  @override
  State<AddRoomWidget> createState() => _AddRoomWidgetState();
}

class _AddRoomWidgetState extends State<AddRoomWidget> {
  void validateThenDoAddRoom(BuildContext context) {
    if (context.read<RoomCubit>().formkey.currentState!.validate()) {
      context.read<RoomCubit>().addRoomCubit(
        instituteId: widget.instituteId,
        centerId: widget.centerId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddRoomListener(
      instituteId: widget.instituteId,
      centerId: widget.centerId,
      child: Form(
        key: context.read<RoomCubit>().formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.w),
            width: double.infinity,
            height: height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              spacing: 15.h,
              children: [
                Text('Name'),
                AppTextFormField(
                  hintText: 'name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: context.read<RoomCubit>().name,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddRoom(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

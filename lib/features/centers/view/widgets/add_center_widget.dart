import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/widgets/add_center_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCenterWidget extends StatefulWidget {
  const AddCenterWidget({super.key});

  @override
  State<AddCenterWidget> createState() => _AddCenterWidgetState();
}

class _AddCenterWidgetState extends State<AddCenterWidget> {
  void validateThenDoAddCenter(BuildContext context) {
    if (context.read<CenterCubit>().formkey.currentState!.validate()) {
      context.read<CenterCubit>().addCenterCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddCenterListener(
      child: Form(
        key: context.read<CenterCubit>().formkey,
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
                  controller: context.read<CenterCubit>().name,
                ),
                Text('Location'),
                AppTextFormField(
                  controller: context.read<CenterCubit>().location,

                  hintText: 'location',

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddCenter(context);
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

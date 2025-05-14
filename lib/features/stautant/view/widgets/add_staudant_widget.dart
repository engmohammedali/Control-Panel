import 'package:controlpanel/core/helpers/space_helper.dart';
import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/core/theming/styles.dart';
import 'package:controlpanel/core/widgets/app_text_button.dart';
import 'package:controlpanel/core/widgets/app_text_form_field.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:controlpanel/features/stautant/view/widgets/add_staudant_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStaudantWidget extends StatefulWidget {
  const AddStaudantWidget({super.key});

  @override
  State<AddStaudantWidget> createState() => _AddStaudantWidgetState();
}

class _AddStaudantWidgetState extends State<AddStaudantWidget> {
  void validateThenDoAddStaudant(BuildContext context) {
    if (context.read<StaudantCubit>().formkey.currentState!.validate()) {
      context.read<StaudantCubit>().addStudentCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return AddStaudantListener(
      child: Form(
        key: context.read<StaudantCubit>().formkey,
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
                  controller: context.read<StaudantCubit>().name,
                ),

                verticalspace(5),
                AppTextButton(
                  buttonText: 'add',
                  textStyle: TextStyles.font18DarkBlueBold.copyWith(
                    color: ColorsManager.white,
                  ),
                  onPressed: () {
                    validateThenDoAddStaudant(context);
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

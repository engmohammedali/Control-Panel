import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/exercieses/view/widgets/add_exercies_widget.dart';
import 'package:controlpanel/features/exercieses/view/widgets/exercies_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciesView extends StatelessWidget {
  final int instituteId;
  final int centerId;
  final int roomId;
  final int lessonId;
  const ExerciesView({
    super.key,
    required this.instituteId,
    required this.centerId,
    required this.roomId,
    required this.lessonId,
  });

  void _addExercies(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<ExerciesCubit>(),
          child: AddExerciesWidget(
            instituteId: instituteId,
            centerId: centerId,
            roomId: roomId,
            lessonId: lessonId,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsManager.moreLighterGray,
        onPressed: () {
          _addExercies(context);
        },
        icon: Icon(Icons.add, color: ColorsManager.mainBlue),
        label: Text(
          'add Exercies',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),

      appBar: AppBar(
        title: Text(
          'Exercies',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: Column(children: [ExerciesBuilderWidget()]),
      ),
    );
  }
}

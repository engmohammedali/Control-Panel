import 'package:controlpanel/core/theming/colors.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:controlpanel/features/stautant/view/widgets/add_staudant_widget.dart';
import 'package:controlpanel/features/stautant/view/widgets/staudant_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaudantView extends StatelessWidget {
  final List<Staudant> students;
  const StaudantView({super.key, required this.students});
  void _addStudent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<StaudantCubit>(),
          child: AddStaudantWidget(),
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
          _addStudent(context);
        },
        icon: Icon(Icons.add, color: ColorsManager.mainBlue),
        label: Text(
          'add Student',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      appBar: AppBar(
        title: Text(
          ' Student',
          style: TextStyle(color: ColorsManager.darkBlue),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

        child: StaudantBuilderWidget(students: students),
      ),
    );
  }
}

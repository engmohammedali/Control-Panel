import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/features/home/view/widgets/home_shimmer_loading.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:controlpanel/features/stautant/logic/staudant_state.dart';
import 'package:controlpanel/features/stautant/view/widgets/custom_staudant_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaudantBuilderWidget extends StatelessWidget {
  final List<Staudant> students;
  const StaudantBuilderWidget({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaudantCubit, StaudantState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is StaudantStateFailure ||
              current is StaudantStateSuccess ||
              current is StaudantStateLoading,
      builder: (context, state) {
        if (state is StaudantStateLoading) {
          return setUpLoading();
        }
        if (state is StaudantStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is StaudantStateSuccess) {
          return setUpSuccess(state.students);
        }

        return setUpSuccess(students);
      },
    );
  }

  setUpSuccess(List<Staudant> students) {
    return Flexible(
      child: ListView.builder(
        itemCount: students.length,
        itemBuilder:
            (context, index) =>
                CustomStaudantWidget(student: students[index], onTaped: () {}),
      ),
    );
  }

  setUpError(BuildContext context, String message) {
    Toast().error(context, message);
  }

  Widget setUpLoading() {
    return HomeShimmerLoading();
  }
}

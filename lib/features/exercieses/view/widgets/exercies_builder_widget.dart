import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_state.dart';
import 'package:controlpanel/features/exercieses/view/widgets/custom_exercies_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciesBuilderWidget extends StatelessWidget {
  const ExerciesBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciesCubit, ExerciesState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is ExerciesStateFailure ||
              current is ExerciesStateSuccess ||
              current is ExerciesStateLoading,
      builder: (context, state) {
        if (state is ExerciesStateLoading) {
          return setUpLoading();
        }
        if (state is ExerciesStateFailure) {
          return setUpError(context, state.message);
        }

        if (state is ExerciesStateSuccess) {
          return setUpSuccess(state.exercieses);
        }
        return setUpSuccess([]);
      },
    );
  }

  Widget setUpSuccess(List<Exercies> exercieses) {
    if (exercieses.isEmpty) {
      return const Center(child: Text("No exercies added"));
    } 
    return Flexible(
      child: ListView.builder(
        itemCount: exercieses.length,
        itemBuilder:
            (context, index) => CustomExerciesWidget(
              exercies: exercieses[index],
              onTapped: () {},
            ),
      ),
    );
  }

  Widget setUpError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast().error(context, message);
    });

    return Center(child: Text("Error $message"));
  }

  Widget setUpLoading() {
    return ShimmerLoading();
  }
}

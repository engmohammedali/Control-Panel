import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/data/model/institute.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_state.dart';
import 'package:controlpanel/features/home/widgets/custom_institusts_widget.dart';
import 'package:controlpanel/features/home/widgets/home_shimmer_loading.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitustsBuilderWidget extends StatelessWidget {
  const InstitustsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstitutesCubit, InstitutesState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is InstitutesFeathStateFailure ||
              current is InstitutesFeathStateSuccess ||
              current is InstitutesFeathStateLoading,
      builder: (context, state) {
        if (state is InstitutesFeathStateLoading) {
          return setUpLoading();
        }
        if (state is InstitutesFeathStateFailure) {
          return setUpError(context, state.message);
        }
        if (state is InstitutesFeathStateSuccess) {
          return setUpSuccess(state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  setUpSuccess(InstitutesFeathStateSuccess state) {
    return Flexible(
      child: ListView.builder(
        itemCount: state.institutes.length,
        itemBuilder:
            (context, index) => CustomInstitustsWidget(
              institute: Institute(
                centers: state.institutes[index].centers,
                id: state.institutes[index].id,
                name: state.institutes[index].name,
                location: state.institutes[index].location,
              ),
              onTaped: () {},
            ),
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

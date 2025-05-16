import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/routing/extension.dart';
import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/dashboard/data/model/institute.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_state.dart';
import 'package:controlpanel/features/dashboard/view/widgets/custom_institusts_widget.dart';
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
          return setUpSuccess(state.institutes);
        }
        return setUpSuccess([]);
      },
    );
  }

  setUpSuccess(List<Institute> institutes) {
    if (institutes.isEmpty) {
      return const Center(child: Text("No institutes found"));
    }
    return ListView.builder(
      itemCount: institutes.length,
      itemBuilder:
          (context, index) => CustomInstitustsWidget(
            institute: Institute(
              centers: institutes[index].centers,
              id: institutes[index].id,
              name: institutes[index].name,
              location: institutes[index].location,
            ),
            onTaped: () {
              context.pushNamed(
                Routes.centers,
                arguments: institutes[index].id,
              );
            },
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

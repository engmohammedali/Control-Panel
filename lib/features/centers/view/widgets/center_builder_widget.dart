import 'package:controlpanel/core/helpers/extensions.dart';
import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/core/widgets/shimmer_loading.dart';
import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/logic/center_state.dart';
import 'package:controlpanel/features/centers/view/widgets/custom_center.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterBuilderWidget extends StatelessWidget {
  final int instituteId;
  const CenterBuilderWidget({super.key, required this.instituteId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CenterCubit, CenterState>(
      buildWhen:
          (previous, current) =>
              previous != current ||
              current is CenterStateFeathFailure ||
              current is CenterStateFeathSuccess ||
              current is CenterStateFeathLoading,
      builder: (context, state) {
        if (state is CenterStateFeathLoading) {
          return setUpLoading();
        }
        if (state is CenterStateFeathFailure) {
          return setUpError(context, state.message);
        }
        if (state is CenterStateFeathSuccess) {
          return setUpSuccess(state.centers);
        }

        return Center(child: Text('No Centers Found'));
      },
    );
  }

  setUpSuccess(List<CenterModel> centers) {
    return Flexible(
      child: ListView.builder(
        itemCount: centers.length,
        itemBuilder:
            (context, index) => CustomCenterWidget(
              center: CenterModel(
                id: centers[index].id,
                name: centers[index].name,
              ),
              onTaped: () {
                context.pushNamed(
                  Routes.room,
                  arguments: [instituteId, centers[index].id],
                );
              },
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
    return const ShimmerLoading();
  }
}

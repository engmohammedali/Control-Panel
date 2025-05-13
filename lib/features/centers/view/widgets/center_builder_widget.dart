import 'package:controlpanel/core/helpers/toast.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/logic/center_state.dart';
import 'package:controlpanel/features/centers/view/widgets/custom_center.widget.dart';
import 'package:controlpanel/features/home/widgets/home_shimmer_loading.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterBuilderWidget extends StatelessWidget {
  final List<CenterModel> centers;
  const CenterBuilderWidget({super.key, required this.centers});

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
        if (centers.isEmpty) {
          return const Center(child: Text('No Centers Found'));
        }

        return Flexible(
          child: ListView.builder(
            itemCount: centers.length,
            itemBuilder:
                (context, index) => CustomCenterWidget(
                  center: CenterModel(
                    id: centers[index].id,
                    name: centers[index].name,
                  ),
                  onTaped: () {},
                ),
          ),
        );
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

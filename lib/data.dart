import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/data/model/institute.dart';

final List<Institute> institutes = [
  Institute(
    centers: [
      CenterModel(name: 'mork', id: 1),
      CenterModel(name: 'mork', id: 2),
    ],
    id: 1,
    name: 'hama',
    location: 'homs',
  ),
  Institute(
    centers: [
      CenterModel(name: 'mork', id: 3),
      CenterModel(name: 'mork', id: 4),
    ],
    id: 2,
    name: 'hama',
    location: 'homs',
  ),
];

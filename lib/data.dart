import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/data/model/institute.dart';

final List<Institute> institutes = [
  Institute(centers: centers, id: 1, name: 'hama', location: 'homs'),
];

final List<CenterModel> centers = [
  CenterModel(name: 'mork', id: 1),
  CenterModel(name: 'omer', id: 2),
];

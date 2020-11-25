import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._independentServices,
  ..._dependentServices
];

List<SingleChildWidget> _independentServices = <SingleChildWidget>[];

List<SingleChildWidget> _dependentServices = <SingleChildWidget>[];



import 'package:ddz/models/route_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeViewModelProvider = StateNotifierProvider<RouteViewModel, RouteModel>((ref) {
  return RouteViewModel();
});

class RouteViewModel extends StateNotifier<RouteModel> {
  RouteViewModel() : super(RouteModel(2, [1.0]));

  void addNode(double edgeLength) {
    state = RouteModel(state.numberOfNodes + 1, [...state.edgesLengths, edgeLength]);
  }
}

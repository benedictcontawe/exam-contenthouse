export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/services/server.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context) : super(loading_view.ViewState(), context: context);

  @override
  Future<void> init() async {
    super.init();
    final service = context.server;
    final Map<String,dynamic> response = await service.data;
    emit(loading_view.ViewState());
    if (response["status_code"] == 503) {
      emit(error_view.ViewState());
      return;
    }
    emit(main_view.ViewState (
      response["image"],
      response["message"],
      response["count"],
    ));
  }

  Future<void> addToCount() async {
    emit(loading_view.ViewState());
    final service = context.server;
    final response = await service.data as Map<String,dynamic>;
    service.addToCount(1);  
    if (response["status_code"] == 503) {
      emit(error_view.ViewState());
      return;
    }
    debugPrint("addToCount ${response["count"]}");
    emit(main_view.ViewState (
      response["image"],
      response["message"],
      response["count"],
    ));
  }

  @override
  void updateView() {
    super.updateView();
  }
}

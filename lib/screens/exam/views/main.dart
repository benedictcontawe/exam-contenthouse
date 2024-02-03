import 'package:flutter/material.dart';
import 'package:mobile_exam/app_localizations.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import '../bloc.dart';

class ViewState extends base.ViewState {
  
  ViewState([this.imgage, this.message, this.count]);

  final String? imgage, message;
  final int? count;

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Image.network(imgage ?? ""),
          Text(message ?? "Nil"),
          Text(count.toString()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.bloc.addToCount();
            },
            child: Text(AppLocalizations.of(context).translate("counter_button")),
          ),
          Image.asset('assets/images/flutter_logo.png'),
          Image.asset('assets/images/2.0x/flutter_logo.png'),
          Image.asset('assets/images/3.0x/flutter_logo.png'),
        ],
      ),
    );
  }
}
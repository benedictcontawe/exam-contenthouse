import 'package:flutter/material.dart';
import 'package:mobile_exam/app_localizations.dart';
import 'package:mobile_exam/core/app/view.dart' as base;

import '../bloc.dart';

class ViewState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            AppLocalizations.of(context).translate("homeDescriptionTitle"),
            style: context.texts.displaySmall,
          ),
          const SizedBox(height: 40),
          Text(
            AppLocalizations.of(context).translate("homeDescriptionBody"),
            style: context.texts.bodyMedium,
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/hint_1");
                },
                child: Text(AppLocalizations.of(context).translate("homeHint1ButtonLabel")),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(
                    context,
                    "/hint_2",
                    arguments: {"key": await context.bloc.serverKey},
                  );
                },
                child: Text(AppLocalizations.of(context).translate("homeHint2ButtonLabel")),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/exam");
                },
                child: Text(AppLocalizations.of(context).translate("homeExamButtonLabel")),
              )
            ],
          ),
        ],
      ),
    );
  }
}

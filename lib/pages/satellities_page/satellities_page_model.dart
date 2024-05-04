import '/flutter_flow/flutter_flow_util.dart';
import 'satellities_page_widget.dart' show SatellitiesPageWidget;
import 'package:flutter/material.dart';

class SatellitiesPageModel extends FlutterFlowModel<SatellitiesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

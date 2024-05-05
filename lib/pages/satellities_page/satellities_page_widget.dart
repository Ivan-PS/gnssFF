import '/components/card13_podcast_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'satellities_page_model.dart';
export 'satellities_page_model.dart';

class SatellitiesPageWidget extends StatefulWidget {
  const SatellitiesPageWidget({super.key});

  @override
  State<SatellitiesPageWidget> createState() => _SatellitiesPageWidgetState();
}

class _SatellitiesPageWidgetState extends State<SatellitiesPageWidget> {
  late SatellitiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SatellitiesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: const [
                            'Satellite 1',
                            'Satellite 2',
                            'Satellite 3',
                            'Satellite 4',
                            'Satellite 5',
                            'Satellite 6',
                            'Satellite 7',
                            'Satellite 8',
                            'Satellite 9',
                            'Satellite 10',
                            'Satellite 11',
                            'Satellite 12',
                            'Satellite 13',
                            'Satellite 14',
                            'Satellite 15',
                            'Satellite 16',
                            'Satellite 17',
                            'Satellite 18',
                            'Satellite 19',
                            'Satellite 20',
                            'Satellite 21',
                            'Satellite 22',
                            'Satellite 23',
                            'Satellite 24',
                            'Satellite 25',
                            'Satellite 26',
                            'Satellite 27',
                            'Satellite 28',
                            'Satellite 29',
                            'Satellite30',
                            '31',
                            '32'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 300.0,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Please select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.card13PodcastModel1,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                      wrapWithModel(
                        model: _model.card13PodcastModel2,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                      wrapWithModel(
                        model: _model.card13PodcastModel3,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                      wrapWithModel(
                        model: _model.card13PodcastModel4,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                      wrapWithModel(
                        model: _model.card13PodcastModel5,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                      wrapWithModel(
                        model: _model.card13PodcastModel6,
                        updateCallback: () => setState(() {}),
                        child: const Card13PodcastWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

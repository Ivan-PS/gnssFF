import 'dart:ffi';

import 'package:permission_handler/permission_handler.dart';
import 'package:raw_gnss/raw_gnss.dart';

import '../../Data.dart';
import '../../WebService/WebService.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};
  bool _hasPermissions = false;

  @override
  void initState() {
    _model = createModel(context, () => MainPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(40.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    startReading();
  }

  void startReading() {
    DateTime lastDate = DateTime.now();

    super.initState();

    RawGnss().gnssMeasurementEvents.listen((e) {
      Map<String, dynamic> fields = {};
      Map<String, dynamic> tags = {};

      print("raw");
      e.measurements?.forEach((element) {
        Map<String, dynamic> data = {
          'contents': element.contents,
          'accumulatedDeltaRangeMeters': element.accumulatedDeltaRangeMeters,
          'accumulatedDeltaRangeState': element.accumulatedDeltaRangeState,
          'accumulatedDeltaRangeUncertaintyMeters':
              element.accumulatedDeltaRangeUncertaintyMeters,
          'automaticGainControlLevelDb': element.automaticGainControlLevelDb,
          'carrierFrequencyHz': element.carrierFrequencyHz,
          'cn0DbHz': element.cn0DbHz,
          'constellationType': element.constellationType,
          'multipathIndicator': element.multipathIndicator,
          'pseudorangeRateMetersPerSecond':
              element.pseudorangeRateMetersPerSecond,
          'pseudorangeRateUncertaintyMetersPerSecond':
              element.pseudorangeRateUncertaintyMetersPerSecond,
          'receivedSvTimeNanos': element.receivedSvTimeNanos,
          'receivedSvTimeUncertaintyNanos':
              element.receivedSvTimeUncertaintyNanos,
          'snrInDb': element.snrInDb,
          'state': element.state,
          'svid': element.svid,
          'timeOffsetNanos': element.timeOffsetNanos
        };

        data.forEach((key, value) {
          if (isString(value)) {
            tags[key] = value;
          } else if (isDouble(value) || isInteger(value)) {
            fields[key] = value;
          }
        });
        tags['mac-address'] = getMapDeviceInfo();
        tags["date"] = nowDate();
      });
      WebService.send("raw", tags, fields);
    });

    RawGnss().gnssNavigationMessageEvents.listen((e) {
      print("navigation");
      print(e.string.toString());
    });

    RawGnss().gnssStatusEvents.listen((e) {
      DateTime nowDateA = DateTime.now();
      if (nowDateA.difference(lastDate).inSeconds >= 10) {
        lastDate = DateTime.now();
        e.status?.forEach((element) {
          Map<String, dynamic> data = {
            'azimuthDegrees': element.azimuthDegrees.toString(),
            'carrierFrequencyHz': element.carrierFrequencyHz.toString(),
            'cn0DbHz': element.cn0DbHz.toString(),
            'constellationType': element.constellationType,
            'elevationDegrees': element.elevationDegrees.toString(),
            'svid': element.svid.toString(),
            'hasAlmanacData': element.hasAlmanacData.toString(),
            'hasCarrierFrequencyHz': element.hasCarrierFrequencyHz.toString(),
            'hasEphemerisData': element.hasEphemerisData.toString(),
            'usedInFix': element.usedInFix.toString(),
          };
          Map<String, dynamic> fields = {};
          Map<String, dynamic> tags = {};
          tags["satelliteCount"] = e.satelliteCount;
          data.forEach((key, value) {
            if (isString(value)) {
              tags[key] = value;
            } else if (isDouble(value) || isInteger(value)) {
              fields[key] = value;
            }
          });
          tags['mac-address'] = getMapDeviceInfo();
          tags["date"] = nowDate();

          WebService.send("status", tags, fields);
        });
      }
    });
    Permission.location
        .request()
        .then((value) => setState(() => _hasPermissions = value.isGranted));
  }

  String nowDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    final String formatted = formatter.format(now);
    return formatted;
  }

  bool isString(dynamic value) {
    return value is String;
  }

  bool isDouble(dynamic value) {
    return value is Double;
  }

  bool isInteger(dynamic value) {
    return value is int;
  }

  Map<String, dynamic> getMapDeviceInfo() {
    Map<String, dynamic> data = {
      'version': Data.deviceInfo?.version.codename ?? "",
      'board': Data.deviceInfo?.board ?? "",
      'bootloader': Data.deviceInfo?.bootloader ?? "",
      'brand': Data.deviceInfo?.brand ?? "",
      'device': Data.deviceInfo?.device ?? "",
      'display': Data.deviceInfo?.display ?? "",
      'fingerprint': Data.deviceInfo?.fingerprint ?? "",
      'hardware': Data.deviceInfo?.hardware ?? "",
      'host': Data.deviceInfo?.host ?? "",
      'id': Data.deviceInfo?.id ?? "",
      'manufacturer': Data.deviceInfo?.manufacturer ?? "",
      'model': Data.deviceInfo?.model ?? "",
      'product': Data.deviceInfo?.product ?? "",
    };
    return data;
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
        backgroundColor: const Color(0xADCFDAFB),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: 194.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Galielo Contribution',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 170.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Satellite Used:',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      '\$500.20',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                            CircularPercentIndicator(
                              percent: 0.55,
                              radius: 50.0,
                              lineWidth: 8.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              center: Text(
                                '55%',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'progressBarOnPageLoadAnimation']!),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

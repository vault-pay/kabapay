import '../components/home_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_model.dart';

class HomePageButtonsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for home_button component.
  late HomeButtonModel homeButtonModel1;
  // Model for home_button component.
  late HomeButtonModel homeButtonModel2;
  // Model for home_button component.
  late HomeButtonModel homeButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    homeButtonModel1 = createModel(context, () => HomeButtonModel());
    homeButtonModel2 = createModel(context, () => HomeButtonModel());
    homeButtonModel3 = createModel(context, () => HomeButtonModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}

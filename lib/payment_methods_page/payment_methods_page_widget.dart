import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/phone_model.dart';
import 'package:provider/provider.dart';

import '../components/add_phone_instrument_widget.dart';
import '../components/nav_back_button_widget.dart';
import '../components/phone_payment_method_item_widget.dart';
import '../components/tokens_list_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_methods_page_model.dart';
export 'payment_methods_page_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class PaymentMethodsPageWidget extends StatefulWidget {
  const PaymentMethodsPageWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodsPageWidgetState createState() =>
      _PaymentMethodsPageWidgetState();
}

class _PaymentMethodsPageWidgetState extends State<PaymentMethodsPageWidget> {
  late PaymentMethodsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'payment_methods_page'});
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onSelectedPayment(BuildContext context, String phoneNumber) async {
      Provider.of<CurrentTransactionModel>(context, listen: false)
          .addPhone(PhoneModel(number: phoneNumber, telecom: "Voda", mobileMoney: "Mpesa"));
      logFirebaseEvent(
          'PAYMENT_METHODS_Container_vzt3cso2_ON_TA');
      logFirebaseEvent(
          'phone_payment_method_item_navigate_to');

      context.pushNamed(
        'confirmation_page',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType:
            PageTransitionType.rightToLeft,
          ),
        },
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: NavBackButtonWidget(
              titleKey: '9r7aauvp' /* How will you pay? */,
              firebaseEvent: 'PAYMENT_METHODS_chevron_left_ICN_ON_TAP',
              firebaseEvent2: 'IconButton_navigate_back',
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).backgroundcolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'br10fnam' /* Select your payment method */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            final phones = List.generate(
                                    random_data.randomInteger(3, 3),
                                    (index) =>
                                        random_data.randomName(true, true))
                                .toList()
                                .take(3)
                                .toList();
                            if (phones.isEmpty) {
                              return TokensListPlaceholderWidget();
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: phones.length,
                              itemBuilder: (context, phonesIndex) {
                                final phonesItem = phones[phonesIndex];
                                return InkWell(
                                  onTap: () async {
                                    _onSelectedPayment(context, phonesItem);
                                  },
                                  child: PhonePaymentMethodItemWidget(
                                    key: Key(
                                        'Keyvzt_${phonesIndex}_of_${phones.length}'),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'lfjf7ceh' /* Or  */,
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 1),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PAYMENT_METHODS_ADD_NEW_NUMBER_BTN_ON_TA');
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height: 340,
                                      child: AddPhoneInstrumentWidget(),
                                    ),
                                  );
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'bcv1wdx6' /* Add new number */,
                            ),
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              color: Color(0xFF42444C),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

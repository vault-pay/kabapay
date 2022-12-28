import '../components/token_item_widget.dart';
import '../components/tokens_list_placeholder_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TokensListWidget extends StatefulWidget {
  const TokensListWidget({Key? key}) : super(key: key);

  @override
  _TokensListWidgetState createState() => _TokensListWidgetState();
}

class _TokensListWidgetState extends State<TokensListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final items = List.generate(random_data.randomInteger(5, 5),
                  (index) => random_data.randomName(true, false))
              .toList()
              .take(5)
              .toList();
          if (items.isEmpty) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: TokensListPlaceholderWidget(),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, itemsIndex) {
              final itemsItem = items[itemsIndex];
              return InkWell(
                onTap: () async {
                  logFirebaseEvent('TOKENS_LIST_Container_ywi18osh_ON_TAP');
                  logFirebaseEvent('token_item_navigate_to');

                  context.pushNamed(
                    'buy_token_page',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
                child: TokenItemWidget(
                  key: UniqueKey(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

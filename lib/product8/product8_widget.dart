import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product8_model.dart';
export 'product8_model.dart';

class Product8Widget extends StatefulWidget {
  /// ProductDetail
  const Product8Widget({
    super.key,
    required this.image,
    required this.nombre,
    required this.price,
    required this.description,
    required this.item,
  });

  final String? image;
  final String? nombre;
  final double? price;
  final String? description;
  final DocumentReference? item;

  @override
  State<Product8Widget> createState() => _Product8WidgetState();
}

class _Product8WidgetState extends State<Product8Widget>
    with TickerProviderStateMixin {
  late Product8Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Product8Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) => cartRecord
            .where(
              'creator',
              isEqualTo: currentUserReference,
            )
            .where(
              'isActive',
              isEqualTo: true,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF39ABEF),
                  ),
                ),
              ),
            ),
          );
        }
        List<CartRecord> product8CartRecordList = snapshot.data!;
        final product8CartRecord = product8CartRecordList.isNotEmpty
            ? product8CartRecordList.first
            : null;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDBE2E7),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Hero(
                                tag: widget!.image!,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    widget!.image!,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0x3A000000),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 46.0,
                                            icon: Icon(
                                              Icons.arrow_back_rounded,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            onPressed: () async {
                                              context.pop();
                                            },
                                          ),
                                        ),
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0x3A000000),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 46.0,
                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 20.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget!.nombre,
                                'nombre',
                              ),
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              formatNumber(
                                widget!.price,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: 'Q',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'DESCRIPCIÓN',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.description,
                                  'description',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 50.0),
                                  child: Container(
                                    width: 160.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0xFF9E9E9E),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: enabled
                                            ? Color(0xDD000000)
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      incrementIconBuilder: (enabled) => FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0xFFEEEEEE),
                                        size: 20.0,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      count: _model.countControllerValue ??= 1,
                                      updateCount: (count) => safeSetState(() =>
                                          _model.countControllerValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 18.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  5.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              functions.newCustomFunction(
                                                  _model.countControllerValue!,
                                                  widget!.price!),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                              currency: '\$',
                                            ),
                                            '0.00',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'subtotal',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (product8CartRecord != null) {
                                      var selectedItemsRecordReference1 =
                                          SelectedItemsRecord.collection.doc();
                                      await selectedItemsRecordReference1
                                          .set(createSelectedItemsRecordData(
                                        product: widget!.item,
                                        nombre: widget!.nombre,
                                        description: widget!.description,
                                        image: widget!.image,
                                        price: widget!.price,
                                        subTotal: valueOrDefault<double>(
                                          functions.newCustomFunction(
                                              _model.countControllerValue!,
                                              widget!.price!),
                                          0.00,
                                        ),
                                        creator: currentUserReference,
                                        cantidad: _model.countControllerValue,
                                      ));
                                      _model.productoCreado1Exist =
                                          SelectedItemsRecord
                                              .getDocumentFromData(
                                                  createSelectedItemsRecordData(
                                                    product: widget!.item,
                                                    nombre: widget!.nombre,
                                                    description:
                                                        widget!.description,
                                                    image: widget!.image,
                                                    price: widget!.price,
                                                    subTotal:
                                                        valueOrDefault<double>(
                                                      functions.newCustomFunction(
                                                          _model
                                                              .countControllerValue!,
                                                          widget!.price!),
                                                      0.00,
                                                    ),
                                                    creator:
                                                        currentUserReference,
                                                    cantidad: _model
                                                        .countControllerValue,
                                                  ),
                                                  selectedItemsRecordReference1);

                                      await product8CartRecord!.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'itemCount': FieldValue.increment(
                                                _model.countControllerValue!),
                                            'amount': FieldValue.increment(
                                                _model.productoCreado1Exist!
                                                    .subTotal),
                                            'selectedItemsList':
                                                FieldValue.arrayUnion([
                                              _model.productoCreado1Exist
                                                  ?.reference
                                            ]),
                                          },
                                        ),
                                      });
                                    } else {
                                      var selectedItemsRecordReference2 =
                                          SelectedItemsRecord.collection.doc();
                                      await selectedItemsRecordReference2
                                          .set(createSelectedItemsRecordData(
                                        product: widget!.item,
                                        nombre: widget!.nombre,
                                        description: widget!.description,
                                        image: widget!.image,
                                        price: widget!.price,
                                        subTotal: valueOrDefault<double>(
                                          functions.newCustomFunction(
                                              _model.countControllerValue!,
                                              widget!.price!),
                                          0.00,
                                        ),
                                        creator: currentUserReference,
                                        cantidad: _model.countControllerValue,
                                      ));
                                      _model.productoCreado = SelectedItemsRecord
                                          .getDocumentFromData(
                                              createSelectedItemsRecordData(
                                                product: widget!.item,
                                                nombre: widget!.nombre,
                                                description:
                                                    widget!.description,
                                                image: widget!.image,
                                                price: widget!.price,
                                                subTotal:
                                                    valueOrDefault<double>(
                                                  functions.newCustomFunction(
                                                      _model
                                                          .countControllerValue!,
                                                      widget!.price!),
                                                  0.00,
                                                ),
                                                creator: currentUserReference,
                                                cantidad:
                                                    _model.countControllerValue,
                                              ),
                                              selectedItemsRecordReference2);

                                      await CartRecord.collection.doc().set({
                                        ...createCartRecordData(
                                          creator: currentUserReference,
                                          itemCount:
                                              _model.countControllerValue,
                                          isActive: true,
                                          amount: valueOrDefault<double>(
                                            functions.newCustomFunction(
                                                _model.countControllerValue!,
                                                widget!.price!),
                                            0.00,
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'selectedItemsList': [
                                              _model.productoCreado?.reference
                                            ],
                                          },
                                        ),
                                      });
                                    }

                                    context.safePop();

                                    safeSetState(() {});
                                  },
                                  text: 'Anadir a carrito',
                                  options: FFButtonOptions(
                                    width: 180.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      !loggedIn
                                          ? Color(0xFFCE2626)
                                          : FlutterFlowTheme.of(context)
                                              .primary,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

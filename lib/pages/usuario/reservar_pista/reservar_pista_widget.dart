import 'package:url_launcher/url_launcher.dart';
import '../../../components/navbar_y_appbar_usuario.dart';
import '../../../utils/auto_size_text/src/auto_fontsize_text.dart';
import '../../../utils/calendar/calendar.dart';
import '../../../utils/format_date.dart';
import '../../../utils/format_number.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'input_pista.dart';
import 'reservar_pista_model.dart';
export 'reservar_pista_model.dart';

class ReservarPistaWidget extends StatefulWidget {
  const ReservarPistaWidget({Key? key}) : super(key: key);

  @override
  _ReservarPistaWidgetState createState() => _ReservarPistaWidgetState();
}

class _ReservarPistaWidgetState extends State<ReservarPistaWidget>
    with TickerProviderStateMixin {
  TextEditingController codigoDescuentoController = TextEditingController();
  SelectionController controller2 = SelectionController();
  late ReservarPistaModel _model;
  late List<DateTime?> singleDatePickerValueWithDefaultValue;
  DateTime? selectDay;
  DateTime? selectDayConfig;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode myFocusNode = FocusNode();
  int diaHoy = 0;
  bool exitsDatos = false;
  bool terms = false;

  List<List<double>> horarios = [
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
    [7.3, 9, 10.3, 12, 13.3, 15, 16.3, 18, 19.3, 21, 22.30],
  ];
  List<List<bool>> horariosbool = [
    [true, true, true, true, true, true, true, false, true, false, true],
    [true, true, false, false, false, true, true, false, true, false, true],
    [true, true, true, true, true, true, true, false, true, false, true],
    [true, false, false, true, true, true, true, false, true, false, true],
    [true, true, true, true, true, true, true, false, true, false, true],
    [true, true, false, false, false, true, true, false, true, false, true],
    [true, true, true, true, true, true, true, false, true, false, true],
    [true, true, false, false, false, true, true, false, true, false, true],
    [true, true, true, true, true, true, true, false, true, false, true],
  ];
  double horario = 0.0;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservarPistaModel());
    singleDatePickerValueWithDefaultValue = [_model.fechaAnterior()];
    diaHoy = singleDatePickerValueWithDefaultValue[0]!.day;

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.deporteController ??= TextEditingController();
    _model.deporteFocusNode ??= FocusNode();

    _model.nPistaController ??= TextEditingController();
    _model.nPistaFocusNode ??= FocusNode();

    _model.localidadController ??= TextEditingController();
    _model.localidadFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return NavbarYAppbarUsuario(
      title: 'Reservar Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10.0, 10.0, 5.0),
                child: InputRPista(
                  controller: _model.localidadController,
                  focusNode: _model.localidadFocusNode,
                  context: context,
                  labelText: 'Localidad',
                  itemsDD: const [
                    'Belvis de Monroy',
                    'Riolobos',
                    'Casar de Palomaro',
                    'Cheles',
                    'Helechosa de los Montes',
                    'Orellana La Vieja',
                    'Aldea del Cano',
                    'Tayuela',
                    'Tayuela Club',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10.0, 10.0, 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InputRPista(
                        controller: _model.deporteController,
                        focusNode: _model.deporteFocusNode,
                        context: context,
                        labelText: 'Deporte',
                        itemsDD: const [
                          '🥎 Padel',
                          '🎾 Tenis',
                          '🏸 Badminton',
                          '🏊‍♀️ Piscina climatizada',
                          '🏊‍♀️ Piscina',
                          '🏀 Baloncesto',
                          '⚽ Futbol sala',
                          '⚽ Futbol 7',
                          '⚽ Futbol 11',
                          '🥍 Pickleball',
                          '🏸 Squash',
                          '🏓 Tenis de mesa',
                          '🏓 Fronton',
                          '⚽ Balomano',
                          '🏉 Rugby',
                          '🥅 Pista multideporte',
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Flexible(
                      child: InputRPista(
                        controller: _model.nPistaController,
                        focusNode: _model.nPistaFocusNode,
                        context: context,
                        labelText: 'N° de pista',
                        itemsDD: const [
                          '1',
                          '2',
                          '3',
                          '4',
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Calendar(
                config: CalendarConfig(
                    dayBorderRadius: BorderRadius.all(Radius.zero),
                    currentDate: _model.fechaAnterior(),
                    selectDayConfig: selectDayConfig,
                    controlsTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 20)),
                value: singleDatePickerValueWithDefaultValue,
                // onValueChanged: (dates) {
                //   // setState(() {
                //   //   selectDay = dates[0];
                //   //   selectDayConfig = dates[0];
                //   // });
                //   Future.delayed(Duration(milliseconds: 100), () {
                //     FocusScope.of(context).requestFocus(FocusNode());
                //   });
                // },
              ),
              selectDay != null
                  ? Focus(
                      focusNode: myFocusNode,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 50,
                              color: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    FormatDate.dateToString(selectDay!),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 28),
                                  ),
                                ),
                              )),
                          buildHorarios(),
                        ],
                      ))
                  : SizedBox.shrink(),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                child: !exitsDatos
                    ? SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Column(children: [
                          ..._buildDatos(),
                          SizedBox(
                            height: 10,
                          )
                        ]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorarios() {
    final int positionDate = selectDay!.day - (diaHoy);
    return Column(
        children: List.generate(1, (col) {
      final List<Widget> rows = [];
      for (var i = 0; i < horarios[col].length; i = i + 4) {
        rows.add(Row(
            children: List<Widget>.generate(4, (row) {
          if ((row + i) < horarios[positionDate].length) {
            if (horariosbool[positionDate][row + i]) {
              return InkWell(
                onTap: () {
                  setState(() {
                    horario = (horarios[positionDate][row + i]);
                    exitsDatos = true;
                  });
                },
                child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width / 4,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 255, 21),
                        border: Border.all(width: 0.5, color: Colors.white)),
                    child: Center(
                        child: Text(
                      pruebahora(horarios[positionDate][row + i]),
                      style: TextStyle(fontSize: 20),
                    ))),
              );
            }
            return Container(
                height: 40,
                width: MediaQuery.sizeOf(context).width / 4,
                decoration: BoxDecoration(
                    color: Color(0xffc0c0c0),
                    border: Border.all(width: 0.5, color: Colors.white)),
                child: Center(
                    child: Text(
                  pruebahora(horarios[positionDate][row + i]),
                  style: TextStyle(fontSize: 20),
                )));
          } else {
            return Container(
              height: 40,
              width: (MediaQuery.sizeOf(context).width * 0.9) / 4,
            );
          }
        })));
      }
      return Column(
        children: rows,
      );
    }));
  }

  String pruebahora(double number) {
    final String local = FormatNumber.eliminarWithTwoDecimals(number);

    return local.toString().replaceAll(".", ":");
  }

  List<Widget> _buildDatos() {
    final List<Widget> list = [];

    final datos = [
      "Localidad",
      "Deporte",
      "N° de pista",
      "Comienza",
      "Finaliza",
      "Duration",
      "Precio",
      "Código descuento"
    ];
    final comienzo =
        FormatDate.dateToString(selectDay!) + " " + pruebahora(horario);
    final finaliza =
        FormatDate.dateToString(selectDay!) + " " + fechaSiguiente();
    final autoComienzo = AutoFontSizeText(comienzo,
        maxLines: 1, styleOld: TextStyle(color: Colors.white, fontSize: 15));
    final fontSizeComienzo = autoComienzo.getFontSize(
        context,
        BoxConstraints.expand(
            height: double.infinity,
            width: MediaQuery.sizeOf(context).width * 0.99 - 118));
    final autoFinaliza = AutoFontSizeText(finaliza,
        maxLines: 1, styleOld: TextStyle(color: Colors.white, fontSize: 15));
    final fontSizeFinaliza = autoFinaliza.getFontSize(
        context,
        BoxConstraints.expand(
            height: double.infinity,
            width: MediaQuery.sizeOf(context).width * 0.99 - 118));
    final double fontSize = (fontSizeComienzo <= fontSizeFinaliza)
        ? fontSizeComienzo
        : fontSizeFinaliza;

    final datosList = [
      _model.localidadController.text,
      _model.deporteController.text,
      _model.nPistaController.text,
      comienzo,
      finaliza,
      "90 minutos",
      "4.00€",
      "code"
    ];
    print(datos);
    for (var i = 0; i < datos.length; i++) {
      if (datosList[i] == "code") {
        list.add(
          Container(
            width: MediaQuery.sizeOf(context).width - 16,
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Text(datos[i] + ":",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.99 - 128,
                  child: TextFormField(
                    controller: codigoDescuentoController,
                    maxLength: 10,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Usa aquí el cupón descuento',
                      hintStyle: TextStyle(
                        fontSize: fontSize,
                      ),
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffC0D914))),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        list.add(
          Container(
            width: MediaQuery.sizeOf(context).width - 16,
            height: 20,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Text(datos[i] + ":",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          color: Color(0xff4c4c4c))),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.99 - 128,
                  child: Text(datosList[i],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      )),
                ),
              ],
            ),
          ),
        );
      }
    }
    list.add(SizedBox(
      height: 5,
    ));
    list.add(Row(
      children: [
        Checkbox(
          value: terms,
          onChanged: (value) {
            setState(() {
              terms = !terms;
            });
          },
        ),
        RichText(
          text: TextSpan(
              text: "Sí, he leído y acepto ",
              style: TextStyle(color: Colors.black, fontSize: fontSize),
              children: [
                TextSpan(
                    text:
                        "la política de privacidad\ny las condiciones generales.",
                    style: TextStyle(color: Colors.blue))
              ]),
        )
      ],
    ));
    list.add(SizedBox(
      height: 5,
    ));
    list.add(
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectionWidget(
              label: 'Monedero Virtual',
              value: 'monedero',
              controller: controller2,
            ),
            const SizedBox(
              width: 16,
            ),
            SelectionWidget(
              label: 'Tarjeta',
              value: 'tarjeta',
              controller: controller2,
            ),
          ],
        ),
      ),
    );
    list.add(SizedBox(
      height: 5,
    ));
    list.add(SizedBox(
      width: MediaQuery.sizeOf(context).width - 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildButton(), SizedBox(width: 40), buildCancelar()],
      ),
    ));
    return list;
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        if (terms &&
            controller2.selectedOption.value != '' &&
            controller2.selectedOption.value != 'rellenar') {
          // Get.dialog(AnswerDialog(
          //   onPressed: () => {Navigator.pop(context)},
          //   answer: "Reserva de pista",
          //   title: controller2.selectedOption.value == 'monedero'
          //       ? 'Monedero Virtual'
          //       : "Tarjeta",
          //   importe: 4.0,
          //   titleButton: "Pagar",
          // ));
        }
        // ButtonsSounds.playSound();
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.sizeOf(context).width * 0.3,
              20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Confirmar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildCancelar() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          horario = 0;
        });
        // ButtonsSounds.playSound();
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(211, 255, 48, 48)),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.sizeOf(context).width * 0.3,
              20), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: const Center(
        child: Text(
          "Cancelar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  String fechaSiguiente() {
    final split = horario.toString().split('.');
    DateTime initialTime =
        DateTime(2023, 1, 1, int.parse(split[0]), int.parse(split[1]) * 10);
    final duration = Duration(minutes: 60);
    initialTime = initialTime.add(duration);

    String horaDia = DateFormat('HH:mm').format(initialTime);
    return horaDia;
  }
}

class SelectionController {
  ValueNotifier<String?> selectedOption = ValueNotifier<String>('');
}

class SelectionWidget extends StatelessWidget {
  final String label;
  final String value;
  final SelectionController controller;

  SelectionWidget({
    required this.label,
    required this.value,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: controller.selectedOption,
      builder: (context, selectedValue, _) {
        bool isSelected = selectedValue == value;

        return GestureDetector(
          onTap: () {
            controller.selectedOption.value = value;
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width / 2 - 30,
            height: 90,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.blue.withOpacity(0.5)
                      : Colors.transparent,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                // value == 'monedero'
                //     ? SvgPicture.asset(
                //         'assets/svg/icon_monedero_virtual.svg',
                //         height: 45,
                //         width: 45,
                //         fit: BoxFit.fill,
                //         colorFilter: ColorFilter.mode(
                //             isSelected ? Colors.white : Colors.black,
                //             BlendMode.srcIn),
                //       )
                //     :
                Icon(
                  Icons.credit_card,
                  size: 40,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                value == 'monedero'
                    ? Text(
                        "336,00€",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}

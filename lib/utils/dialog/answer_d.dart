import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../buttons_sounds.dart';
import '../format_number.dart';
import '../sizer.dart';

/// Alerta personalizada
class AnswerDialog extends StatefulWidget {
  final void Function() onPressed;
  final double importe;
  final String? answer;
  final String? title;
  final String? titleButton;

  /// Alerta personalizada.
  AnswerDialog(
      {Key? key,
      required this.onPressed,
      required this.importe,
      this.answer,
      this.title,
      this.titleButton})
      : super(key: key);

  createState() => _AnswerDialogState();
}

class _AnswerDialogState extends State<AnswerDialog> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Container(
          height: 100.h,
          color: Color(0xffE8EDE7).withOpacity(0.6),
          child: Container(
            height: 100.h,
            width: 100.w,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 100,
                    width: 20.w,
                    child: GestureDetector(
                      onTap: () =>
                          {ButtonsSounds.playSound(), Navigator.pop(context)},
                      child: Image(
                        image: const AssetImage("assets/icon_close_dialog.png"),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  )),
                  color: Color(0xff3498DB),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Card(
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Color.fromARGB(34, 0, 0,
                              0), // Ajusta el color de la sombra según sea necesario
                          width:
                              1.0, // Ajusta el ancho de la sombra según sea necesario
                        ),
                      ),
                      color: Color(0xff3498DB),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100.w,
                            height: 68.h,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 2),
                            child: Card(
                                elevation: 4,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.answer ??
                                            "¿Desea recargar el monedero virtual?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Roboto',
                                          color: const Color.fromARGB(
                                              255, 28, 20, 20),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 80,
                                              child: Center(
                                                child: Text(
                                                  widget.title ??
                                                      "Recargar Monedero Virtual",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Roboto',
                                                    color: const Color.fromARGB(
                                                        255, 28, 20, 20),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              child: Text(
                                            FormatNumber
                                                    .formatNumberWithTwoDecimals(
                                                        widget.importe) +
                                                "€",
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildButton(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(192, 0, 255, 123)),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(40.w, 50), // Ajusta el ancho y alto según tus necesidades
        ),
      ),
      child: Center(
        child: Text(
          widget.titleButton ?? "Confirmar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Roboto",
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

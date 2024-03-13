import 'package:flutter/material.dart';
import '../../utils/sizer.dart';

class TermConditions extends StatelessWidget {
  const TermConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 20.w,
                child: Icon(
                  Icons.book,
                  size: 80,
                  color: Color(0xff4285d0),
                ),
              ),
              Container(
                height: 180,
                width: 80.w,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Términos y Condiciones de Servicio",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff4285d0),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily: "Roboto",
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Text(
                      "Actualización: 27/11/2023",
                      style: TextStyle(
                          color: Color(0xff9f9f9f),
                          decoration: TextDecoration.none,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "1. Lorem",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "2. Lorem",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "3. Lorem",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff9f9f9f),
                        decoration: TextDecoration.none,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 50.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Color(0xff4285d0)),
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajusta el radio de los bordes según tus necesidades
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff04285d0),
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ),
              Container(
                width: 50.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff4285d0)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Color(0xff4285d0)),
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajusta el radio de los bordes según tus necesidades
                        ),
                      ),
                    ),
                    child: const Text(
                      "Aceptar",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(239, 255, 255, 255),
                          fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

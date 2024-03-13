import 'dart:io';
import 'package:flutter/material.dart';

Widget getImage(String? nameFile,
    {bool isRegristro = false,
    bool isProveedor = false,
    double? width,
    double? height,
    Color? color,
    IconData? icon}) {
  if (isRegristro) {
    return nameFile != null
        ? nameFile[0] == '@'
            ? Image.asset(
                'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(nameFile),
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
        : Icon(icon ?? Icons.edit_square,
            color: color ?? const Color(0xFF5A9BEE), size: 40);
  } else {
    return nameFile != null
        ? nameFile[0] == '@'
            ? Image.asset(
                'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(nameFile),
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
        : Image.asset(
            isProveedor
                ? 'assets/images/logo_reservatupista.png'
                : 'assets/images/foto_avatar.png',
            width: width ?? 100.0,
            height: height ?? 100.0,
            fit: BoxFit.cover,
          );
  }
}

Widget getImageFile(String? nameFile,
    {bool isRegristro = false,
    double? width,
    double? height,
    Color? color,
    IconData? icon}) {
  if (isRegristro) {
    return nameFile != null
        ? nameFile[0] == '@'
            ? Image.asset(
                'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(nameFile),
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
        : Icon(icon ?? Icons.edit_square,
            color: color ?? Color(0xFF5A9BEE), size: 40);
  } else {
    return nameFile != null
        ? nameFile[0] == '@'
            ? Image.asset(
                'assets/images/${nameFile.substring(1, nameFile.length)}.png',
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(nameFile),
                width: width ?? 100.0,
                height: height ?? 100.0,
                fit: BoxFit.cover,
              )
        : Image.asset(
            'assets/images/foto_avatar.png',
            width: width ?? 100.0,
            height: height ?? 100.0,
            fit: BoxFit.cover,
          );
  }
}

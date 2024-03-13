import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/sizer.dart';
import '../../../routes/database.dart';
import '../../../routes/models/datos_reservas_pista.dart';

class HorarioFinInicio {
  HorarioFinInicio(
      {required this.inicio,
      required this.termino,
      required this.typeEstadoHorario});
  final String inicio;
  final String termino;
  final TypeEstadoHorario typeEstadoHorario;
  bool isEquals(HorarioFinInicio horaFinInicio) {
    final bool validar =
        horaFinInicio.inicio == inicio && horaFinInicio.termino == termino;
    return validar;
  }
}

class ReservarPistaController extends GetxController
    with SingleGetTickerProviderMixin {
  DatabaseController db = Get.find();
  Rx<int?> selectLocalidad = Rx<int?>(null);
  Rx<int?> selectClub = Rx<int?>(null);
  Rx<int?> selectDeporte = Rx<int?>(null);
  // Rx<int?> selectedDay = Rx<int?>(null);
  Rx<int?> selectPista = Rx<int?>(null);
  Rx<int?> selectDay = Rx<int?>(null);
  Rx<String?> selectedItemDeporte = Rx<String?>(null);

  Rx<HorarioFinInicio?> selectHorario = Rx<HorarioFinInicio?>(null);
  final ScrollController scrollController = ScrollController();
  Rx<DateTime?> selectDateDay = Rx<DateTime?>(null);
  late List<DateTime?> singleDatePickerValueWithDefaultValue;
  RxList<bool> listReservas = [false, false, false, false].obs;
  TextEditingController localidadController = TextEditingController();
  FocusNode localidadFocusNode = FocusNode();
  TextEditingController deporteController = TextEditingController();
  FocusNode deporteFocusNode = FocusNode();
  TextEditingController nPistaController = TextEditingController();
  FocusNode nPistaFocusNode = FocusNode();
  TextEditingController clubController = TextEditingController();
  FocusNode clubFocusNode = FocusNode();
  TextEditingController codigoDescuentoController = TextEditingController();

  /// Global Keys
  GlobalKey keyInputs = GlobalKey();
  GlobalKey keyCalendar = GlobalKey();
  GlobalKey keyHorarios = GlobalKey();
  GlobalKey keyPistas = GlobalKey();
  GlobalKey keyDatos = GlobalKey();

  int diaHoy = 0;
  RxBool terms = false.obs;
  RxDouble totalHeight = 0.0.obs;
  RxDouble sizedBoxHeight = 0.0.obs;
  late DateTime fechaActual;
  late List<DateTime> tiempoReservaListaCalendar;

  final appBarAndNavBar = 120;
  PageController pageViewController = PageController();
  @override
  void onInit() {
    super.onInit();
    fechaActual = DateTime.now();
    debounce(sizedBoxHeight, (callback) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }, time: const Duration(milliseconds: 50));
    debounce(selectDay, (callback) {
      if (callback != null) {
        final sizeCalendar = (keyCalendar.currentContext != null
            ? keyCalendar.currentContext!.size!.height
            : 0.0);
        final sizeHorarios = (keyHorarios.currentContext != null
            ? keyHorarios.currentContext!.size!.height
            : 0.0);
        final sizePistas = (keyPistas.currentContext != null
            ? keyPistas.currentContext!.size!.height
            : 0.0);
        final newSize = (100.h -
            (sizeCalendar + sizePistas + appBarAndNavBar + sizeHorarios));
        if (newSize < 0) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + newSize,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          if (sizedBoxHeight.value == newSize) {
            sizedBoxHeight.refresh();
          } else {
            sizedBoxHeight.value = newSize;
          }
        }
        pageViewController.animateToPage(callback,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    }, time: const Duration(milliseconds: 50));
    debounce(selectHorario, (callback) async {
      if (callback != null) {
        final sizeDatos = (keyDatos.currentContext != null
            ? keyDatos.currentContext!.size!.height
            : 0.0);
        final sizePistas = (keyPistas.currentContext != null
            ? keyPistas.currentContext!.size!.height
            : 0.0);
        final newSize = (100.h -
            (sizePistas +
                appBarAndNavBar +
                keyHorarios.currentContext!.size!.height +
                sizeDatos));
        if (newSize < 0) {
          // sizedBoxHeight.refresh();
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + newSize,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          if (sizedBoxHeight.value == newSize) {
            sizedBoxHeight.refresh();
          } else {
            sizedBoxHeight.value = newSize;
          }
        }
      }
    }, time: const Duration(milliseconds: 50));
    singleDatePickerValueWithDefaultValue = [fechaActual];
    diaHoy = singleDatePickerValueWithDefaultValue[0]!.day;
    tiempoReservaListaCalendar = getListaHorarios();
  }

  List<DateTime> getListaHorarios() {
    return List.generate(
        db.datosReserva.tiempoReserva, (index) => getAddDia(index));
  }

  DateTime fechaAnterior() {
    // Obtén la fecha y hora actual
    DateTime fechaActual = DateTime.now();

    // Crea una duración de un día (24 horas)
    const unDia = Duration(days: 1);

    // Resta un día a la fecha actual
    return fechaActual.add(unDia);
  }

  DateTime getAddDia(int days) {
    final addDia = Duration(days: days);
    return fechaActual.add(addDia);
  }

  SvgPicture _buildSvgIcon(String asset) {
    return SvgPicture.asset(
      asset,
      height: 5,
      width: 5,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(
          const Color.fromARGB(255, 145, 145, 145), BlendMode.srcIn),
    );
  }
}

class SelectionController {
  ValueNotifier<String?> selectedOption = ValueNotifier<String>('');
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import './iban_model.dart';
import './iban_paste_input_formatter.dart';
import './spaced_text_input_formatter.dart';

class IbanFormField extends FormField<Iban> {
  IbanFormField({
    Key? key,
    FormFieldSetter<Iban>? onSaved,
    FormFieldValidator<Iban>? validator,
    Iban? initialValue,
    bool autofocus = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue ?? Iban(''),
          builder: (state) {
            return IbanFormFieldBuilder(state, autofocus);
          },
        );
}

class IbanFormFieldBuilder extends StatefulWidget {
  IbanFormFieldBuilder(this.state, this.autofocus);

  final FormFieldState<Iban> state;
  final bool autofocus;

  @override
  State createState() => _IbanFormFieldState();
}

class _IbanFormFieldState extends State<IbanFormFieldBuilder> {
  static const _maxCountryCodeLength = 2;
  static const _maxCheckDigitLength = 2;
  final focusedColor = Color(0xFF46EF98);
  final lineColor = Color.fromARGB(160, 70, 239, 152);

  final TextEditingController _controllerCountryCode = TextEditingController();
  final TextEditingController _controllerCheckDigits = TextEditingController();
  final TextEditingController _controllerBasicBankAccountNumber =
      TextEditingController();

  // Used for jumping to next/previous field
  final FocusNode _focusCountryCode = FocusNode();
  final FocusNode _focusCheckDigits = FocusNode();
  final FocusNode _focusBasicBankAccountNumber = FocusNode();

  // Used to determine if the user added or deleted characters
  int? _previousCountryCodeLength;
  int? _previousCheckDigitsLength;
  int? _previousBasicBankAccountNumberLength;

  bool _lastCountryCodeCharacterAdded(int currentLength, int? previousLength) {
    return currentLength == _maxCountryCodeLength &&
        currentLength - previousLength! == 1;
  }

  bool _lastCheckDigitCharacterAdded(int currentLength, int? previousLength) {
    return currentLength == _maxCheckDigitLength &&
        currentLength - previousLength! == 1;
  }

  bool _lastCheckDigitCharacterDeleted(int currentLength, int? previousLength) {
    return currentLength == 0 && currentLength - previousLength! == -1;
  }

  bool _lastBasicBankAccountNumberCharacterDeleted(
      int currentLength, int? previousLength) {
    return currentLength == 0 && currentLength - previousLength! == -1;
  }

  @override
  void initState() {
    super.initState();

    _controllerCountryCode.text = widget.state.value!.countryCode!;
    _controllerCheckDigits.text = widget.state.value!.checkDigits ?? "";
    _controllerBasicBankAccountNumber.text =
        widget.state.value!.basicBankAccountNumber ?? "";

    _previousCountryCodeLength = widget.state.value!.countryCode?.length ?? 0;
    _previousCheckDigitsLength = widget.state.value!.checkDigits?.length ?? 0;
    _previousBasicBankAccountNumberLength =
        widget.state.value!.basicBankAccountNumber?.length ?? 0;

    _controllerCountryCode.addListener(() {
      widget.state.value!.countryCode = _controllerCountryCode.text;

      if (_lastCountryCodeCharacterAdded(
          _controllerCountryCode.text.length, _previousCountryCodeLength)) {
        setState(() {
          widget.state.value!.countryCode = _controllerCountryCode.text;
        });
        _focusCountryCode.nextFocus();
      }

      _previousCountryCodeLength = _controllerCountryCode.text.length;
    });

    _controllerCheckDigits.addListener(() {
      widget.state.value!.checkDigits = _controllerCheckDigits.text;

      if (_lastCheckDigitCharacterDeleted(
          _controllerCheckDigits.text.length, _previousCheckDigitsLength)) {
        _focusCheckDigits.previousFocus();
      }

      if (_lastCheckDigitCharacterAdded(
          _controllerCheckDigits.text.length, _previousCheckDigitsLength)) {
        _focusCheckDigits.nextFocus();
      }

      _previousCheckDigitsLength = _controllerCheckDigits.text.length;
    });

    _controllerBasicBankAccountNumber.addListener(() {
      widget.state.value!.basicBankAccountNumber =
          _controllerBasicBankAccountNumber.text;

      if (_lastBasicBankAccountNumberCharacterDeleted(
          _controllerBasicBankAccountNumber.text.length,
          _previousBasicBankAccountNumberLength)) {
        _focusBasicBankAccountNumber.previousFocus();
      }

      _previousBasicBankAccountNumberLength =
          _controllerBasicBankAccountNumber.text.length;
    });
  }

  @override
  void dispose() {
    _controllerCountryCode.dispose();
    _controllerCheckDigits.dispose();
    _controllerBasicBankAccountNumber.dispose();

    super.dispose();
  }

  bool _autofocusForCountryCode() {
    return widget.autofocus &&
        _controllerCountryCode.text.length < _maxCountryCodeLength;
  }

  bool _autofocusForCheckDigits() {
    return widget.autofocus &&
        !_autofocusForCountryCode() &&
        _controllerCheckDigits.text.length < _maxCheckDigitLength;
  }

  bool _autofocusForBasicBankAccountNumbers() {
    return widget.autofocus &&
        !_autofocusForCountryCode() &&
        !_autofocusForCheckDigits();
  }

  @override
  Widget build(BuildContext context) {
    var constraints = BoxConstraints.tightFor(
      width: Theme.of(widget.state.context).textTheme.bodyText2!.fontSize! *
          1.1 *
          3.5,
    );
    InputDecoration decoration({String? hintText, String? errorText}) =>
        InputDecoration(
            hintText: hintText,
            errorText: errorText,
            counterText: '',
            errorStyle: const TextStyle(fontSize: 0),
            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF95A1AC),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: lineColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            contentPadding: EdgeInsets.all(4));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              child: TextFormField(
                key: Key('iban-form-field-country-code'),
                controller: _controllerCountryCode,
                focusNode: _focusCountryCode,
                decoration: decoration(
                  hintText: widget.state.value!.countryCodeHintText,
                  errorText: widget.state.hasError ? '' : null,
                ),
                textInputAction: TextInputAction.next,
                onSaved: (countryCode) {
                  widget.state.value!.countryCode = countryCode;
                },
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  IbanPasteInputFormatter.countryCode(
                    _controllerCheckDigits,
                    _controllerBasicBankAccountNumber,
                  ),
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(RegExp('[A-Z]')),
                ],
              ),
            ),
            // Container(
            //   constraints: constraints,
            //   padding: EdgeInsets.only(right: 5),
            //   child: TextFormField(
            //     key: Key('iban-form-field-check-digits'),
            //     controller: _controllerCheckDigits,
            //     keyboardType: TextInputType.number,
            //     maxLength: 20,
            //     focusNode: _focusCheckDigits,
            //     decoration: decoration(
            //       hintText: widget.state.value!.checkDigitsHintText,
            //       errorText: widget.state.hasError ? '' : null,
            //     ),
            //     textInputAction: TextInputAction.next,
            //     onSaved: (checkDigits) {
            //       widget.state.value!.checkDigits = checkDigits;
            //     },
            //     inputFormatters: [
            //       IbanPasteInputFormatter.checkDigits(
            //         _controllerCountryCode,
            //         _controllerBasicBankAccountNumber,
            //       ),
            //       LengthLimitingTextInputFormatter(2),
            //       FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            //     ],
            //   ),
            // ),

            Flexible(
              child: TextFormField(
                key: Key('iban-form-field-basic-bank-account-number'),
                keyboardType: TextInputType.number,
                controller: _controllerBasicBankAccountNumber,
                autofocus: _autofocusForBasicBankAccountNumbers(),
                focusNode: _focusBasicBankAccountNumber,
                decoration: decoration(
                  hintText: widget.state.value!.basicBankAccountNumberHintText,
                  errorText: widget.state.hasError ? '' : null,
                ),
                onSaved: (basicBankAccountNumber) {
                  widget.state.value!.basicBankAccountNumber =
                      basicBankAccountNumber;
                },
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  IbanPasteInputFormatter.basicBankAccountNumber(
                    _controllerCountryCode,
                    _controllerCheckDigits,
                  ),
                  LengthLimitingTextInputFormatter(
                      widget.state.value!.maxBasicBankAccountNumberLength),
                  SpacedTextInputFormatter(),
                ],
              ),
            ),
          ],
        ),
        if (widget.state.hasError)
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              widget.state.errorText!,
              style: Theme.of(context).inputDecorationTheme.errorStyle ??
                  Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Theme.of(context).errorColor),
            ),
          ),
      ],
    );
  }
}

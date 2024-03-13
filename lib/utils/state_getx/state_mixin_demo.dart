import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension StateRxExt<T> on StateRx<T> {
  Widget obx(
    NotifierBuilder<T?> widget, {
    Widget Function(String? error)? onError,
    Widget? onLoading,
    Widget? onEmpty,
  }) {
    return Obx(() {
      final newValue = rx.value;
      return SimpleBuilder(builder: (_) {
        if (status.isLoading) {
          return onLoading ?? const Center(child: CircularProgressIndicator());
        } else if (status.isError) {
          return onError != null
              ? onError(status.errorMessage)
              : Center(child: Text('A error occurred: ${status.errorMessage}'));
        } else if (status.isEmpty) {
          return onEmpty ??
              const SizedBox.shrink(); // Also can be widget(null); but is risky
        }
        return widget(newValue);
      });
    });
  }
}

class StateRx<T> {
  Rx<T> rx;
  RxStatusDemo status = RxStatusDemo.empty();
  StateRx(
    this.rx,
  );

  void change(T newValue, RxStatusDemo rxStatusDemo) {
    status = rxStatusDemo;
    if (rx.value == newValue) {
      rx.refresh();
    } else {
      rx.value = newValue;
    }
  }

  void changeStatus(RxStatusDemo rxStatusDemo) {
    if (rxStatusDemo != status) {
      status = rxStatusDemo;
      rx.refresh();
    }
  }

  void initStatus(RxStatusDemo rxStatusDemo) {
    status = rxStatusDemo;
  }
}

class RxStatusDemo {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isEmpty;
  final bool isLoadingMore;
  final String? errorMessage;

  RxStatusDemo._({
    this.isEmpty = false,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isLoadingMore = false,
  });

  factory RxStatusDemo.loading() {
    return RxStatusDemo._(isLoading: true);
  }

  factory RxStatusDemo.loadingMore() {
    return RxStatusDemo._(isSuccess: true, isLoadingMore: true);
  }

  factory RxStatusDemo.success() {
    return RxStatusDemo._(isSuccess: true);
  }

  factory RxStatusDemo.error([String? message]) {
    return RxStatusDemo._(isError: true, errorMessage: message);
  }

  factory RxStatusDemo.empty() {
    return RxStatusDemo._(isEmpty: true);
  }
}

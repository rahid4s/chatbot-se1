// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ServerLinkValueKey = 'serverLink';
const String QueryValueKey = 'query';

final Map<String, TextEditingController> _HomeViewTextEditingControllers = {};

final Map<String, FocusNode> _HomeViewFocusNodes = {};

final Map<String, String? Function(String?)?> _HomeViewTextValidations = {
  ServerLinkValueKey: null,
  QueryValueKey: null,
};

mixin $HomeView {
  TextEditingController get serverLinkController =>
      _getFormTextEditingController(ServerLinkValueKey);
  TextEditingController get queryController =>
      _getFormTextEditingController(QueryValueKey);

  FocusNode get serverLinkFocusNode => _getFormFocusNode(ServerLinkValueKey);
  FocusNode get queryFocusNode => _getFormFocusNode(QueryValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_HomeViewTextEditingControllers.containsKey(key)) {
      return _HomeViewTextEditingControllers[key]!;
    }

    _HomeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _HomeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_HomeViewFocusNodes.containsKey(key)) {
      return _HomeViewFocusNodes[key]!;
    }
    _HomeViewFocusNodes[key] = FocusNode();
    return _HomeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    serverLinkController.addListener(() => _updateFormData(model));
    queryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    serverLinkController.addListener(() => _updateFormData(model));
    queryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ServerLinkValueKey: serverLinkController.text,
          QueryValueKey: queryController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _HomeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _HomeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _HomeViewTextEditingControllers.clear();
    _HomeViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get serverLinkValue =>
      this.formValueMap[ServerLinkValueKey] as String?;
  String? get queryValue => this.formValueMap[QueryValueKey] as String?;

  set serverLinkValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ServerLinkValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(ServerLinkValueKey)) {
      _HomeViewTextEditingControllers[ServerLinkValueKey]?.text = value ?? '';
    }
  }

  set queryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({QueryValueKey: value}),
    );

    if (_HomeViewTextEditingControllers.containsKey(QueryValueKey)) {
      _HomeViewTextEditingControllers[QueryValueKey]?.text = value ?? '';
    }
  }

  bool get hasServerLink =>
      this.formValueMap.containsKey(ServerLinkValueKey) &&
      (serverLinkValue?.isNotEmpty ?? false);
  bool get hasQuery =>
      this.formValueMap.containsKey(QueryValueKey) &&
      (queryValue?.isNotEmpty ?? false);

  bool get hasServerLinkValidationMessage =>
      this.fieldsValidationMessages[ServerLinkValueKey]?.isNotEmpty ?? false;
  bool get hasQueryValidationMessage =>
      this.fieldsValidationMessages[QueryValueKey]?.isNotEmpty ?? false;

  String? get serverLinkValidationMessage =>
      this.fieldsValidationMessages[ServerLinkValueKey];
  String? get queryValidationMessage =>
      this.fieldsValidationMessages[QueryValueKey];
}

extension Methods on FormStateHelper {
  setServerLinkValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ServerLinkValueKey] = validationMessage;
  setQueryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QueryValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    serverLinkValue = '';
    queryValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ServerLinkValueKey: getValidationMessage(ServerLinkValueKey),
      QueryValueKey: getValidationMessage(QueryValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _HomeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _HomeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ServerLinkValueKey: getValidationMessage(ServerLinkValueKey),
      QueryValueKey: getValidationMessage(QueryValueKey),
    });

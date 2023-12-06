// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String UsernameValueKey = 'username';
const String PasswordValueKey = 'password';

final Map<String, TextEditingController> _SigninViewTextEditingControllers = {};

final Map<String, FocusNode> _SigninViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SigninViewTextValidations = {
  UsernameValueKey: null,
  PasswordValueKey: null,
};

mixin $SigninView {
  TextEditingController get usernameController =>
      _getFormTextEditingController(UsernameValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);

  FocusNode get usernameFocusNode => _getFormFocusNode(UsernameValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SigninViewTextEditingControllers.containsKey(key)) {
      return _SigninViewTextEditingControllers[key]!;
    }

    _SigninViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SigninViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SigninViewFocusNodes.containsKey(key)) {
      return _SigninViewFocusNodes[key]!;
    }
    _SigninViewFocusNodes[key] = FocusNode();
    return _SigninViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    usernameController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UsernameValueKey: usernameController.text,
          PasswordValueKey: passwordController.text,
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

    for (var controller in _SigninViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SigninViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SigninViewTextEditingControllers.clear();
    _SigninViewFocusNodes.clear();
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

  String? get usernameValue => this.formValueMap[UsernameValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  set usernameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({UsernameValueKey: value}),
    );

    if (_SigninViewTextEditingControllers.containsKey(UsernameValueKey)) {
      _SigninViewTextEditingControllers[UsernameValueKey]?.text = value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_SigninViewTextEditingControllers.containsKey(PasswordValueKey)) {
      _SigninViewTextEditingControllers[PasswordValueKey]?.text = value ?? '';
    }
  }

  bool get hasUsername =>
      this.formValueMap.containsKey(UsernameValueKey) &&
      (usernameValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasUsernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get usernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
}

extension Methods on FormStateHelper {
  setUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    usernameValue = '';
    passwordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UsernameValueKey: getValidationMessage(UsernameValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SigninViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SigninViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      UsernameValueKey: getValidationMessage(UsernameValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });

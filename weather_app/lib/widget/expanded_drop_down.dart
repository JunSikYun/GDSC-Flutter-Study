import 'package:flutter/material.dart';
import 'package:weather_app/models/src/countries.dart';

class DropDownExpanded<T> extends FormField<T> {
  final bool isExpanded;
  final T? initialValue;

  DropDownExpanded({
    required this.isExpanded,
    this.initialValue,
    required this.onChanged,
    Key? key,
    required List<DropdownMenuItem<T>> items,
    InputDecoration decoration = const InputDecoration(),
    required FormFieldSetter<T> onSaved,
    required FormFieldValidator<T> validator,
    required Widget hint, required Country value,
  }) : super(
            key: key,
            onSaved: onSaved,
            initialValue: initialValue, // Use initialValue here
            validator: validator,
            builder: (FormFieldState<T> field) {
              final InputDecoration effectiveDecoration =
                  decoration.applyDefaults(Theme.of(field.context).inputDecorationTheme);
              return InputDecorator(
                decoration: effectiveDecoration.copyWith(errorText: field.errorText),
                isEmpty: field.value == null,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    isDense: true,
                    value: field.value, // Use field.value
                    items: items,
                    hint: hint,
                    isExpanded: isExpanded,
                    onChanged: field.didChange,
                  ),
                ),
              );
            });

  final ValueChanged<T?> onChanged; // onChanged should accept null

  @override
  FormFieldState<T> createState() => _DropdownButtonFormFieldState<T>();
}

class _DropdownButtonFormFieldState<T> extends FormFieldState<T> {
  @override
  DropDownExpanded<T> get widget => super.widget as DropDownExpanded<T>; // Correct casting

  @override
  void didChange(T? value) {
    super.didChange(value);
    widget.onChanged(value);
  }
}

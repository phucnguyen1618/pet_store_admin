import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? title;
  final String? label;
  final String? hint;
  final String? error;
  final String? help;
  final TextEditingController textController;
  final bool? isVisible;
  final Widget? suffixWidget;
  final IconData? prefixIcon;
  final bool isRequired;
  final TextInputType? inputType;
  final int? maxLineInput;
  final String? Function(String?)? validatorInput;
  final Widget? child;
  final bool? isReadOnly;

  const TextInput({
    super.key,
    this.title,
    this.label,
    this.hint,
    required this.textController,
    this.isVisible,
    this.error,
    this.suffixWidget,
    this.prefixIcon,
    this.help,
    this.isRequired = false,
    this.inputType,
    this.maxLineInput,
    this.validatorInput,
    this.child,
    this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            text: TextSpan(
                text: title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                children: isRequired
                    ? [
                        const TextSpan(
                            text: ' *',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                            ))
                      ]
                    : null)),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: textController,
          keyboardType: inputType,
          readOnly: isReadOnly ?? false,
          maxLines: maxLineInput,
          validator: validatorInput,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8.0),
              hintText: hint,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixWidget,
              errorText: error,
              helperText: help,
              helperMaxLines: 2,
              border: const OutlineInputBorder()),
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}

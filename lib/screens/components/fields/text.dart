import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/services/i18n.dart';
import 'package:journal/managers/fields/rx_field.dart';

class RxTextField extends StatelessWidget {
  final RxTextFieldManager manager;
  final Widget Function(BuildContext, String) builder;

  // Title for field
  final String title;

  // Key for title translation
  final String titleTr;

  RxTextField(
    this.manager, {
    this.title,
    this.titleTr,
    Key key,
    String initialValue,
    FocusNode focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction,
    TextStyle style,
    StrutStyle strutStyle,
    TextDirection textDirection,
    TextAlign textAlign = TextAlign.start,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions toolbarOptions,
    bool showCursor,
    bool obscureText = false,
    bool autocorrect = true,
    bool autovalidate = false,
    bool maxLengthEnforced = true,
    int maxLines = 1,
    int minLines,
    bool expands = false,
    int maxLength,
    ValueChanged<String> onChanged,
    GestureTapCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    List<TextInputFormatter> inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius cursorRadius,
    Color cursorColor,
    Brightness keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder buildCounter,
  }) : builder = ((c, error) => TextField(
              decoration: decoration.copyWith(
                labelText: titleTr == null ? title : I18n.t(c, titleTr),
                errorText: error == null ? null : I18n.t(c, error),
              ),
              controller: manager.controller,
              focusNode: manager.focus,
              onSubmitted: (v) {
                if (manager.nextFocus != null)
                  FocusScope.of(c).requestFocus(manager.nextFocus);

                onFieldSubmitted(v);
              },

              // Delegated
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              textAlign: textAlign,
              textDirection: textDirection,
              textCapitalization: textCapitalization,
              autofocus: autofocus,
              toolbarOptions: toolbarOptions,
              readOnly: readOnly,
              showCursor: showCursor,
              obscureText: obscureText,
              autocorrect: autocorrect,
              maxLengthEnforced: maxLengthEnforced,
              maxLines: maxLines,
              minLines: minLines,
              expands: expands,
              maxLength: maxLength,
              onTap: onTap,
              onEditingComplete: onEditingComplete,
              onChanged: onChanged,
              inputFormatters: inputFormatters,
              enabled: enabled,
              cursorWidth: cursorWidth,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor,
              scrollPadding: scrollPadding,
              keyboardAppearance: keyboardAppearance,
              enableInteractiveSelection: enableInteractiveSelection,
              buildCounter: buildCounter,
            ));

  @override
  Widget build(BuildContext c) {
    return StreamBuilder<String>(
      stream: manager.errorStream,
      initialData: null,
      builder: (c, snapshot) => builder(c, snapshot.data),
    );
  }
}

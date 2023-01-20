import 'dart:html';

import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class Checkbox extends Component with ValueChangeEventSource<bool>, MixinDisable implements StateComponent<bool> {
  Checkbox() : super('Checkbox') {
    vAlign = Align.center;
    hAlign = Align.start;
    textAlign = Align.center;

    checkBoxInput.onChange.listen((event) {
      fireValueChange(!value, value);
    });

    element.children.add(checkBoxInput);
    element.children.add(_label);
  }

  @override
  DivElement element = DivElement();

  @override
  List<Element> get disableElements => [checkBoxInput];
  final CheckboxInputElement checkBoxInput = CheckboxInputElement();
  final LabelElement _label = LabelElement();

  bool get value => checkBoxInput.checked ?? false;

  set value(bool value) {
    checkBoxInput
      ..indeterminate = false
      ..checked = value;
  }

  @override
  String get state => value.toString();

  @override
  set state(String newValue) => value = newValue == 'true';

  set caption(String caption) => _label.text = caption;

  String get caption => _label.text ?? '';

  bool get isIndeterminate => checkBoxInput.indeterminate ?? false;

  set isIndeterminate(bool value) => checkBoxInput.indeterminate = value;

  void focus() {
    checkBoxInput.focus();
  }
}

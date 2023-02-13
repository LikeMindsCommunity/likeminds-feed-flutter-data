import 'dart:ui';

const kPrimaryColor = Color.fromARGB(255, 6, 92, 193);

extension StringColor on String {
  Color? toColor() {
    // if (primaryColor != null) {
    if (int.tryParse(this) != null) {
      return Color(int.tryParse(this)!);
    } else {
      return kPrimaryColor;
    }
  }
}

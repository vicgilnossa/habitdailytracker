import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CapitalizeFirstLetterFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    // Verifica si el nuevo texto no está vacío y tiene longitud mayor que cero
    if (newText.isNotEmpty && newText.length > 0) {
      // Obtiene la primera letra del nuevo texto y la convierte en mayúscula
      final firstLetter = newText.substring(0, 1).toUpperCase();
      // Obtiene el resto del nuevo texto y lo deja en minúscula
      final remainingText = newText.substring(1).toLowerCase();
      // Combina la primera letra en mayúscula con el resto del texto en minúscula
      final formattedText = firstLetter + remainingText;
      // Devuelve el nuevo valor de texto con la primera letra en mayúscula y el resto en minúscula
      return TextEditingValue(
        text: formattedText,
        selection: newValue.selection,
      );
    }
    // Devuelve el nuevo valor de texto sin cambios si está vacío o tiene longitud cero
    return newValue;
  }
}

void limitWordFormatter(
    String value, TextEditingController controller, int maxWords) {
  int wordCount = value.trim().split(' ').length;
  if (wordCount > maxWords) {
    String trimmedValue = value.trim().split(' ').take(maxWords).join(' ');
    controller.value = TextEditingValue(
      text: trimmedValue,
      selection: TextSelection.collapsed(offset: trimmedValue.length),
    );
  }
}

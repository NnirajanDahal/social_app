import 'package:flutter/material.dart';

Widget textField({
  text,
  hinttext,
  required controller,
  prefixicon,
  suffixicon,
  obscuretext = false,
  valiDator,
  inputformatters,
  borDer,
}) {
  return TextFormField(
    inputFormatters: inputformatters,
    onChanged: valiDator,
    validator: valiDator,
    obscureText: obscuretext,
    controller: controller,
    decoration: InputDecoration(
      border: borDer,
      hintText: hinttext,
      labelText: text,
      prefixIcon: prefixicon,
      suffixIcon: suffixicon,
    ),
  );
}

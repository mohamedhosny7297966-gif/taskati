

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int maxLines;
  void Function()? onTap;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextEditingController? controller;
   CustomTextFormField({super.key, required this.labelText
  ,this.maxLines=1,
    this.onTap,
     this.suffixIcon,
     this.readOnly=false, this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines,
      readOnly: readOnly,
      controller: controller,
      onTapOutside: (v){
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: labelText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

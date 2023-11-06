import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.numberInputType = false,
      this.icon = Icons.edit,
      this.hintText,
      this.onChanged,
      this.textController,
      this.maxLine = 1,
      this.format = false,
      this.onTap,
      this.viewOnly = true})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textController;
  final bool numberInputType;
  final int maxLine;
  final bool format;
  final VoidCallback? onTap;
  final bool viewOnly;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: maxLine == 1 ? 60 : null,
      margin: const EdgeInsets.symmetric(vertical: 5),
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      child: TextField(
        inputFormatters: numberInputType == true
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                LengthLimitingTextInputFormatter(10),
                if (format)
                  MaskTextInputFormatter(
                      mask: '##:##', filter: {"#": RegExp(r'[0-9]')}),
              ]
            : null,
        keyboardType:
            numberInputType ? TextInputType.number : TextInputType.text,
        enabled: viewOnly,
        controller: textController,
        maxLines: maxLine,
        onChanged: onChanged,
        onTap: onTap,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          labelText: hintText,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).disabledColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7E9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7E9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE5E7E9),
            ),
          ),
        ),
      ),
    );
  }
}

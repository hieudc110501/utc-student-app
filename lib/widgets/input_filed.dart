// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';

class InputField extends StatefulWidget {
  String name;
  String iconUrl;
  TextEditingController controller;
  bool isClick;

  InputField({
    Key? key,
    required this.name,
    required this.iconUrl,
    required this.controller,
    required this.isClick,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late FocusNode _focus;

  @override
  void initState() {
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: grey200,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focus,
        cursorColor: indigo600,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ).copyWith(
          color: _focus.hasFocus ? indigo900 : grey400,
        ),
        decoration: InputDecoration(
          focusColor: rose400,
          prefixIcon: Image.asset(
            widget.iconUrl,
            color: _focus.hasFocus ? indigo900 : grey400,
          ),
          prefixIconColor: grey400,
          hintText: widget.name,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ).copyWith(
            color: grey400,
          ),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          fillColor: whiteText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 0,
              color: whiteText,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: widget.controller.text.isEmpty && widget.isClick
                ? const BorderSide(
                    width: 1,
                    color: indigo900,
                  )
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class UniversalTextField extends StatefulWidget {
  UniversalTextField(
      {super.key,
      required this.hinText,
      this.svgPath = "",
      this.isPassword = false,
      required this.width,
      required this.controller});

  final String hinText;
  final String svgPath;
  bool isPassword;
  final double width;
  final TextEditingController controller;

  @override
  State<UniversalTextField> createState() => _UniversalTextFieldState();
}

class _UniversalTextFieldState extends State<UniversalTextField> {
  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    check = widget.isPassword;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: const Offset(0, 12),
                spreadRadius: .2,
                blurRadius: 12)
          ]),
      child: TextField(
        controller: widget.controller,
        obscureText: check,
        cursorColor: const Color(0xff1317DD),
        decoration: InputDecoration(
            hintText: widget.hinText,
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            prefixIcon: widget.svgPath.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.all(widget.width),
                    child: SvgPicture.asset(
                      widget.svgPath,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      onPressed: () {
                        check = !check;
                        setState(() {});
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/eye.svg",
                        width: 22,
                      ),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}

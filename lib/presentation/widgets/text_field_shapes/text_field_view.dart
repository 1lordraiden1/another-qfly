import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/config/theme/app_theme.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';

class TextFieldRectangle extends StatefulWidget {
  TextFieldRectangle({
    Key? key,
    required this.hint,
    required this.controller,
    this.line = 1,
    this.validate,
    this.isPassword = false,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.isReadOnly = false,
    this.focusNode,
    this.isLoading,
    this.homeCubit,
  }) : super(key: key);
  final String hint;
  final int line;
  final bool isPassword;
  final bool isReadOnly;
  bool? isLoading;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final String? Function(String?)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final FocusNode? focusNode;
  HomeCubit? homeCubit;

  @override
  State<TextFieldRectangle> createState() => _TextFieldRectangleState();
}

class _TextFieldRectangleState extends State<TextFieldRectangle> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return TextFormField(
            focusNode: widget.focusNode ?? FocusNode(),
            readOnly: widget.isReadOnly,
            onTapOutside: widget.onTapOutside,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            validator: widget.validate ?? (v) => null,
            controller: widget.controller,
            obscureText: widget.isPassword && _isVisible ? true : false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: appTheme().primaryColor, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(12),
              ), // InputBorder.none,
              suffixIcon: widget.isLoading ?? false
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : widget.isPassword
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          child: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ))
                      : null,
              hintText: '${widget.hint} ',
              hintStyle:
                  TextStylesManager.regularStyle(fontSize: 14.sp, color: grey),
              contentPadding: EdgeInsets.all(8.w),
            ),
            onChanged: widget.onChanged,
          );
        });
  }
}

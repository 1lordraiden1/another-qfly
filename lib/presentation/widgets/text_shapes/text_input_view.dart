import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/widgets/icon_shapes/circle_border_view.dart';
import 'package:qfly/presentation/widgets/icon_shapes/circle_with_icon_view.dart';
import 'package:qfly/presentation/widgets/text_field_shapes/text_field_view.dart';
import '../../../constant/colors.dart';
import '../../../constant/text_styles_manager.dart';

class TextInputView extends StatefulWidget {
  TextInputView({
    super.key,
    this.label,
    this.hint,
    this.iconPath,
    this.isPassword = false,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.iconPressedPath,
    this.focusNode,
    this.isLoading,
    this.homeCubit,
    this.validate,
  });
  final String? label;
  final String? hint;
  final String? iconPath;

  final String? iconPressedPath;

  final bool isPassword;
  bool? isLoading;

  final String? Function(String?)? onChanged;
  final VoidCallback? onEditingComplete;
  TextEditingController? controller;
  FocusNode? focusNode;
  HomeCubit? homeCubit;
  final String? Function(String?)? validate;

  @override
  State<TextInputView> createState() => _TextInputViewState();
}

class _TextInputViewState extends State<TextInputView> {
  bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(widget.label!,
                style: TextStylesManager.regularStyle(
                  fontSize: 14.sp,
                )),
            8.verticalSpace,
          ],
          Container(
            decoration: BoxDecoration(
              color: veryLightGray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                CircleBorderView(
                  iconPath: isSelected ?? false
                      ? widget.iconPressedPath ?? ImageAssets.flightTripIcon
                      : widget.iconPath ?? ImageAssets.googleIcon,
                ),
                5.horizontalSpace,
                Expanded(
                  child: TextFieldRectangle(
                    homeCubit: widget.homeCubit,
                    isLoading: widget.isLoading ?? false,
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    onTapOutside: (event) {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    validate: widget.validate,
                    onEditingComplete: widget.onEditingComplete,
                    focusNode: widget.focusNode,
                    onChanged: widget.onChanged,
                    hint: widget.hint ?? 'UserName',
                    controller: widget.controller ?? TextEditingController(),
                    isPassword: widget.isPassword,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

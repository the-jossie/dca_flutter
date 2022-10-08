import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/app_config.dart';
import '../config/size_config.dart';
import '../formatters/num.dart';

class DCATextFormField extends StatefulWidget {
  /*
   * This is an abstractions of flutter textfield but with 
   * an added advantage with the default style from design
   * 
   * 
   */
  final TextEditingController? textEditingController;
  final String? title;
  final String? labelText;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? focusedBorderColor;
  final Function? onChange;
  final Function? callBackOnFocus;
  final Function? callBackOffFocus;
  final TextInputType? textInputType;
  final String? formIcon;
  final Function? validator;
  final Function? prefixOnClick;
  final Function? suffixIconOnClick;
  final Color? labelColor;
  final TextStyle? textStyle;
  final bool obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function? onEditingComplete;
  final Function? onSaved;
  final FontWeight titleFontWeight;
  final Color? titleColor;
  final int maxLines;
  final int? minLines;
  final Color fillColor;
  final bool removeBorder;
  final double radius;
  final bool enabled;
  final Color? prefixIconColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool textCapitalization;
  const DCATextFormField({
    Key? key,
    this.textEditingController,
    this.title,
    this.labelText,
    this.textInputType,
    this.formIcon,
    this.onChange,
    this.validator,
    this.obscureText = false,
    this.callBackOnFocus,
    this.callBackOffFocus,
    this.maxLength,
    this.prefixIcon,
    this.prefixOnClick,
    this.textInputAction,
    this.onEditingComplete,
    this.maxLines = 1,
    this.onSaved,
    this.titleFontWeight = FontWeight.w400,
    this.titleColor,
    this.fillColor = Colors.white,
    this.removeBorder = false,
    this.radius = 0,
    this.enabled = true,
    this.inputFormatters,
    this.minLines,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconOnClick,
    this.textCapitalization = true,
    this.labelColor,
    this.textStyle,
    this.focusedBorderColor,
  }) : super(key: key);

  @override
  _DCATextFormFieldState createState() => _DCATextFormFieldState();
}

class _DCATextFormFieldState extends State<DCATextFormField> {
  final _focusNode = FocusNode();
  Color? _iconColor;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(
      () {
        if (widget.callBackOnFocus != null) {
          if (_focusNode.hasFocus) {
            widget.callBackOnFocus!();
          } else {
            widget.callBackOffFocus!();
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      widget.title!,
                      style: TextStyle(
                        fontWeight: widget.titleFontWeight,
                        color: widget.titleColor,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          Focus(
            onFocusChange: (hasFocus) {
              _iconColor =
                  hasFocus ? AppConfigService.hexToColor("#494FB1") : null;
              setState(() {});
            },
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              key: const ValueKey("textinput"),
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              enabled: widget.enabled,
              inputFormatters: widget.inputFormatters,
              minLines: widget.minLines,
              textCapitalization: widget.textCapitalization
                  ? TextCapitalization.words
                  : TextCapitalization.none,
              style: widget.textStyle,
              decoration: InputDecoration(
                hintText: widget.labelText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: widget.labelColor,
                ),
                alignLabelWithHint: true,
                filled: true,
                fillColor: widget.fillColor,
                errorMaxLines: 3,
                suffixIcon: widget.suffixIcon != null
                    ? InkWell(
                        onTap: widget.suffixIconOnClick as void Function()?,
                        child: SvgPicture.asset(
                          widget.suffixIcon!,
                          color: _iconColor,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    : null,
                prefixIcon: widget.prefixIcon != null
                    ? InkWell(
                        onTap: widget.prefixOnClick as void Function()?,
                        child: SvgPicture.asset(
                          widget.prefixIcon!,
                          fit: BoxFit.scaleDown,
                          color: widget.prefixIconColor,
                        ),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppConfigService.hexToColor(
                      widget.focusedBorderColor ?? "#B1D9E7",
                    ),
                  ),
                ),
                focusedBorder: widget.removeBorder
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(widget.radius),
                      )
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppConfigService.hexToColor(
                            widget.focusedBorderColor ?? "#B1D9E7",
                          ),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.radius),
                        ),
                      ),
                enabledBorder: widget.removeBorder
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(widget.radius),
                      )
                    : OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppConfigService.hexToColor("#E0E0E0"),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.radius),
                        ),
                      ),
              ),
              validator: (val) => widget.validator!(val) as String?,
              controller: widget.textEditingController,
              keyboardType: widget.textInputType,
              maxLength: widget.maxLength,
              textInputAction: widget.textInputAction,
              onSaved: (String? value) => widget.onSaved!(value),
              onChanged: widget.onChange as void Function(String)?,
              onEditingComplete: widget.onEditingComplete as void Function()?,
              maxLines: widget.maxLines,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

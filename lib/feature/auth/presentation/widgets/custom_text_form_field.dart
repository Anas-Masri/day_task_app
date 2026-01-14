import 'package:day_task_app/core/exports.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.isVisible = true,
  });
  final String prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.h,
      child: TextFormField(
        style: AppStyles.font18w400(AppColors.whiteColor),
        obscureText: !isVisible,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          fillColor: AppColors.textFormFieldBackgroundColor,
          filled: true,
          prefixIconConstraints: BoxConstraints(),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SvgPicture.asset(prefixIcon),
          ),
          suffixIconConstraints: BoxConstraints(),

          suffixIcon: isPassword
              ? Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Icon(
                    !isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.whiteColor,
                  ),
                )
              : null,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.redColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparentColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparentColor),
          ),
        ),
      ),
    );
  }
}

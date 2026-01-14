import 'package:day_task_app/core/exports.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.prefixIcon,
    this.isPassword = false,
    this.isVisible = true,
  });
  final String title;
  final String prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          style: AppStyles.font18w400(AppColors.filedTextColor),
          text: title,
        ),
        SpaceH(16),

        CustomTextFormField(
          prefixIcon: prefixIcon,
          controller: controller,
          isPassword: isPassword,
          isVisible: isVisible,
        ),
      ],
    );
  }
}

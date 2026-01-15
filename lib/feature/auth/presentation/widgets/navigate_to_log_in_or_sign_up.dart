import 'package:day_task_app/core/exports.dart';

class NavigateToLogInOrSignUp extends StatelessWidget {
  const NavigateToLogInOrSignUp({
    super.key,
    this.onTap,
    required this.fitstText,
    required this.secondText,
  });
  final void Function()? onTap;
  final String fitstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: fitstText,
          style: AppStyles.font16w500(AppColors.filedTextColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: secondText,
            style: AppStyles.font16w600(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}

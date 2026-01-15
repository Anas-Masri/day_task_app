import 'package:day_task_app/core/exports.dart';

class CustomDividerSeperatedWidget extends StatelessWidget {
  const CustomDividerSeperatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            // width: 111.w,
            child: Divider(color: AppColors.filedTextColor),
          ),
        ),
        SpaceW(13),
        CustomText(
          text: 'Or continue with',
          style: AppStyles.font16w500(AppColors.filedTextColor),
        ),
        SpaceW(13),
        Expanded(
          child: SizedBox(
            // width: 111.w,
            child: Divider(color: AppColors.filedTextColor),
          ),
        ),
      ],
    );
  }
}

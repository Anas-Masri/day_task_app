import 'package:day_task_app/core/exports.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImage.googleIcon),
          SpaceW(12),
          CustomText(
            alignment: AlignmentGeometry.center,
            text: 'Google',
            style: AppStyles.font18w500(AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}

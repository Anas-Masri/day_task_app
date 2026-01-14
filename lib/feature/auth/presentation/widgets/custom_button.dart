import 'package:day_task_app/core/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.buttonTitle,
    required this.width,
  });
  final void Function()? onTap;
  final String buttonTitle;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 58.h,
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Text(
          buttonTitle,
          style: AppStyles.font18w600(AppColors.blackColor),
        ),
      ),
    );
  }
}

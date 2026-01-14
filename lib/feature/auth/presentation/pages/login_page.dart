import 'package:day_task_app/core/exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 36.h),
          child: Column(
            children: [
              SvgPicture.asset(AppImage.mainLogo),
              SpaceH(50),
              CustomText(
                style: AppStyles.font26w600(AppColors.whiteColor),
                text: 'Welcome Back!',
              ),
              SpaceH(23),
              CustomInputWidget(
                prefixIcon: AppImage.profileIcon,
                controller: TextEditingController(),
                title: 'Email Address',
              ),
              SpaceH(27),
              CustomInputWidget(
                isPassword: true,
                isVisible: false,
                prefixIcon: AppImage.lockIcon,
                controller: TextEditingController(),
                title: 'Password',
              ),
              SpaceH(13),
              CustomText(
                alignment: Alignment.topRight,

                text: 'Forgot Password?',
                style: AppStyles.font16w500(AppColors.filedTextColor),
              ),
              SpaceH(38),
              CustomButton(buttonTitle: 'Login', width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}

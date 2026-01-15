import 'package:day_task_app/core/exports.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                text: 'Create your account',
              ),
              SpaceH(23),
              CustomInputWidget(
                prefixIcon: AppImage.userNameIcon,
                controller: TextEditingController(),
                title: 'Full Name',
              ),
              SpaceH(27),
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

              SpaceH(38),

              CustomButton(buttonTitle: 'Sign Up', width: double.infinity),
              SpaceH(38),
              CustomDividerSeperatedWidget(),
              SpaceH(38),

              GoogleButton(),
              SpaceH(25),
              NavigateToLogInOrSignUp(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                fitstText: 'Already have an account? ',
                secondText: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

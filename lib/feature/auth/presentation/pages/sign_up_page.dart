import 'package:day_task_app/core/exports.dart';
import 'package:day_task_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:day_task_app/feature/auth/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccsess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else if (state is AuthNeedsEmailConfirmation) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('شيّك الإيميل للتأكيد')));
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                  controller: nameController,
                  title: 'Full Name',
                ),
                SpaceH(27),
                CustomInputWidget(
                  prefixIcon: AppImage.profileIcon,
                  controller: emailController,
                  title: 'Email Address',
                ),
                SpaceH(27),
                CustomInputWidget(
                  isPassword: true,
                  isVisible: false,
                  prefixIcon: AppImage.lockIcon,
                  controller: passwordController,
                  title: 'Password',
                ),
                SpaceH(38),

                // ✅ Loading على الزر
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return isLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            buttonTitle: 'Sign Up',
                            width: double.infinity,
                            onTap: isLoading
                                ? null
                                : () {
                                    context.read<AuthBloc>().add(
                                      AuthSingUp(
                                        email: emailController.text.trim(),
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                          );
                  },
                ),

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
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocListener<AuthBloc, AuthState>(
  //     listener: (context, state) {
  //       if (state is AuthLoading) {
  //         CircularProgressIndicator();
  //       }
  //     },
  //     child: Scaffold(
  //       backgroundColor: AppColors.backgroundColor,
  //       body: SingleChildScrollView(
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 36.h),
  //           child: Column(
  //             children: [
  //               SvgPicture.asset(AppImage.mainLogo),
  //               SpaceH(50),
  //               CustomText(
  //                 style: AppStyles.font26w600(AppColors.whiteColor),
  //                 text: 'Create your account',
  //               ),
  //               SpaceH(23),
  //               CustomInputWidget(
  //                 prefixIcon: AppImage.userNameIcon,
  //                 controller: nameController,
  //                 title: 'Full Name',
  //               ),
  //               SpaceH(27),
  //               CustomInputWidget(
  //                 prefixIcon: AppImage.profileIcon,
  //                 controller: emailController,
  //                 title: 'Email Address',
  //               ),
  //               SpaceH(27),
  //               CustomInputWidget(
  //                 isPassword: true,
  //                 isVisible: false,
  //                 prefixIcon: AppImage.lockIcon,
  //                 controller: passwordController,
  //                 title: 'Password',
  //               ),

  //               SpaceH(38),
  //               CustomButton(
  //                 buttonTitle: 'Sign Up',
  //                 width: double.infinity,
  //                 onTap: () {
  //                   context.read<AuthBloc>().add(
  //                     AuthSingUp(
  //                       email: emailController.text,
  //                       password: passwordController.text,
  //                     ),
  //                   );
  //                 },
  //               ),

  //               SpaceH(38),
  //               CustomDividerSeperatedWidget(),
  //               SpaceH(38),

  //               GoogleButton(),
  //               SpaceH(25),
  //               NavigateToLogInOrSignUp(
  //                 onTap: () {
  //                   Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => LoginPage()),
  //                   );
  //                 },
  //                 fitstText: 'Already have an account? ',
  //                 secondText: 'Log In',
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

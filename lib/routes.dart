import 'package:get/get.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/forgetPassword/check_email_screen.dart';
import 'view/screen/auth/sign_in_screen.dart';
import 'view/screen/auth/sign_up_screen.dart';
import 'view/screen/auth/verify_code_screen.dart';
import 'view/screen/forgetPassword/reset_password_screen.dart';
import 'view/screen/forgetPassword/verify_code_reset_password_screen.dart';
import 'view/screen/home_page.dart';
import 'view/screen/language_screen.dart';
import 'view/screen/onboarding_screen.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(
    name: AppRoutes.language,
    page: () => const LanguageScreen(),
    middlewares: [MyMiddleware()],
  ),
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
  ),

  // ========== Auth ========= //

  GetPage(
    name: AppRoutes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCodeScreen(),
  ),

  // ========== Forget Password ========= //

  GetPage(
    name: AppRoutes.checkEmail,
    page: () => const CheckEmailScreen(),
  ),
  GetPage(
    name: AppRoutes.verifyCodeResPass,
    page: () => const VerifyCodeResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
];
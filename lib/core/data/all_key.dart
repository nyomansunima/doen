class UserKey {
  static String userId = "userId";
}

class ValidationKey {
  static String username = "username";
  static String password = "password";
  static String email = "email";
  static String name = "name";
}

class RoutesKey {
  /**
   * main routes key name
   */
  static const splash = "/splash";
  static const welcome = "/welcome";
  static const signIn = "/signin";
  static const signUp = "/signup";
  static const dashboard = "/dashboard";
  static const forgotPassword = "/forgot-pasword";
  static const forgotPasswordFinish = "/forgot-pasword-finish";

  /**
   * Dashboard menu detail routes key name
   */

  // home
  static const home = "/home";

  // plan
  static const plan = "/plan";

  // report
  static const report = "/report";

  // setting
  static const setting = "/setting";
  static const account = "/account";
  static const editAccount = "/edit_account";

  // plan

  static const addPlan = "/add-plan";
}

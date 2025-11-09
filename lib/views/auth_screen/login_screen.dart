import 'package:get/get.dart';
import 'package:seller_side/consts/const.dart';
import 'package:seller_side/controllers/auth_controller.dart';
import 'package:seller_side/views/home_screen/home.dart';
import 'package:seller_side/views/widgets/loading_indicator.dart';
import 'package:seller_side/views/widgets/our_button.dart';
import 'package:seller_side/views/widgets/text_style.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(AuthController());
    //  Create a reactive boolean for password visibility
    var isPasswordVisible = false.obs;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(icLogo, width: 70, height: 70)
                      .box
                      .border(color: white)
                      .rounded
                      .padding(const EdgeInsets.all(8))
                      .make(),
                  10.widthBox,
                  boldText(text: appname, size: 20.0),
                ],
              ),
              40.heightBox,
              normalText(text: loginTo, size: 18.0, color: lightGrey),
              10.heightBox,

              //  Obx used to rebuild when visibility toggles
              Obx(() => Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: textFieldGrey,
                          prefixIcon: Icon(Icons.email, color: purpleColor),
                          border: InputBorder.none,
                          hintText: emailHint,
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: !isPasswordVisible.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: textFieldGrey,
                          prefixIcon:
                              const Icon(Icons.lock, color: purpleColor),
                          border: InputBorder.none,
                          hintText: passwordHint,
                          //  Add suffix icon here
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: purpleColor,
                            ),
                            onPressed: () {
                              isPasswordVisible.value =
                                  !isPasswordVisible.value;
                            },
                          ),
                        ),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: normalText(
                              text: forgotPassword, color: purpleColor),
                        ),
                      ),
                      10.heightBox,
                      SizedBox(
                        width: context.screenWidth - 100,
                        child: controller.isloading.value
                            ? loadingIndicator()
                            : ourButton(
                                title: login,
                                onPress: () async {
                                  controller.isloading(true);
                                  try {
                                    var userCred =
                                        await controller.loginMethod();
                                    if (userCred != null) {
                                      Get.snackbar(
                                        "Success",
                                        "Login successful!",
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      Get.offAll(() => const Home());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  } catch (e) {
                                    controller.isloading(false);
                                    Get.snackbar(
                                      "Login Failed",
                                      e.toString(),
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                              ),
                      ),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .outerShadowMd
                      .padding(const EdgeInsets.all(8))
                      .make()),
              10.heightBox,
              Center(child: normalText(text: anyProblem, color: lightGrey)),
              const Spacer(),
              Center(child: boldText(text: credit)),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

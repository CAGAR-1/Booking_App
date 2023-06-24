import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:go_fresha/core/presentation/resources/ui_assets.dart';
import 'package:go_fresha/core/presentation/widgets/base_widget.dart';
import 'package:go_fresha/core/presentation/widgets/clipper.dart';
import 'package:go_fresha/core/presentation/widgets/focus_node_disabler.dart';
import 'package:go_fresha/core/presentation/widgets/textfields.dart';
import 'package:go_fresha/feature/auth/data/models/request/login_params.dart';
import 'package:go_fresha/feature/auth/presentation/controller/login_controller.dart';
import 'package:go_fresha/feature/shared/layouts/auth_widget_wrapper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: FocusNodeDisabler(
            child: BaseWidget(builder: (context, config, theme) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    color: theme.primaryColor,
                    child: Image.asset(UiAssets.appLogo),
                  ),
                  clipper: Clipper(),
                ),
                config.verticalSpaceMedium(),
                LoginBuilder(),
              ],
            ),
          );
        })));
  }
}

class LoginBuilder extends StatelessWidget {
  LoginBuilder({
    Key? key,
  }) : super(key: key);

  final LoginParams loginParams = LoginParams();

  @override
  Widget build(BuildContext context) {
    return HookBaseWidget(builder: (context, config, theme) {
      final _loginFormKey = useMemoized(GlobalKey<FormState>.new);

      return Form(
          key: _loginFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: config.appEdgePadding()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryFormField(
                    label: "Email".tr,
                    isRequired: true,
                    onSaved: (value) {
                      loginParams.email = value;
                    }),
                config.verticalSpaceMedium(),
                PrimaryFormField(
                    label: "Password".tr,
                    isRequired: true,
                    onSaved: (value) {
                      loginParams.password = value;
                    }),
                AuthWidgetBuilder(builder: (context, isAuthenticated) {
                  return isAuthenticated ? Text("Yes") : const Text("No");
                }),
                ElevatedButton(
                    onPressed: () {
                      final currentState = _loginFormKey.currentState;
                      if (currentState != null) {
                        currentState.save();
                        if (currentState.validate()) {
                          Get.find<LoginController>()
                              .requestLogin(loginParams, context);
                        }
                      }
                    },
                    child: Text("Sign In"))
              ],
            ),
          ));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/login/login_bloc.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/views/user/login_view/form_login.dart';
import 'package:shop_beer_app/ui/widgets/curved_widget.dart';
import 'package:shop_beer_app/ui/widgets/loader_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    CurvedWidget(
                      curvedDistance: 80.0,
                      curvedHeight: 80.0,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 100.0, left: 50.0),
                        height: 300.0,
                        color: primaryColor,
                        child: Text(
                          "Iniciar sesión",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 30.0, color: whiteColor),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 300.0, right: 28.0, left: 28.0),
                      child: const FormLogin(),
                    ),
                    state.isLoading ? const LoaderWidget() : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

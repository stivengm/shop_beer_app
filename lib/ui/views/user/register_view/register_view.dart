import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/views/user/register_view/form_register.dart';
import 'package:shop_beer_app/ui/widgets/curved_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only( top: 100.0, left: 50.0),
                    height: 300.0,
                    color: primaryColor,
                    child: Text("Registro", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 30.0, color: whiteColor ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only( top: 300.0, right: 28.0, left: 28.0 ),
                  child: const FormRegister(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
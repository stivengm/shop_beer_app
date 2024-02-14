import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/login/login_bloc.dart';
import 'package:shop_beer_app/core/blocs/notifications/notifications_bloc.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/widgets/notifications_widget.dart';
import 'package:shop_beer_app/ui/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({ Key? key }) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => email != null && !EmailValidator.validate(email) ? 'Ingrese un email válido' : null,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            obscureText: _passwordVisible,
            controller: passwordController,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (pass) => pass != null && pass.length < 6 ? 'Ingrese mínimo 6 caracteres' : null,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            ),
          ),
          const SizedBox(height: 10.0),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Siguiente',
            onPressed: signUp
          ),
          const SizedBox(height: 30.0),
          RichText(
            text: TextSpan(
              text: 'Ya tienes una cuenta?',
              style: const TextStyle(
                color: blackColor
              ),
              children: [
                TextSpan(
                  text: ' Inicia sesión',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: _registro()
                )
              ]
            )
          )
        ],
      ),
    );
  }

  Future signUp() async {
    final isValidForm = formKey.currentState!.validate();
    if (!isValidForm) return;

    FocusManager.instance.primaryFocus?.unfocus();

    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    loginBloc.add( const IsLoading(true) );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );
    } on FirebaseException catch (e) {
      String message = '';
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Este correo ya se encuentra en uso, por favor ingrese otro correo o inicie sesión.';
          break;
        default:
      }
      Future.delayed(const Duration(seconds: 8), () {
        loginBloc.add( const IsLoading(false) );
        NotificationsWidget(message: message == '' ? e.message! : message).showNotificationError(context);
      });
      NotificationsWidget(message: message).showNotificationError(context);
    }

    Future.delayed(const Duration(seconds: 8), () {
      notificationsBloc.localNotifications(
        body: 'Te has registrado a ShopBeer'
      );
      loginBloc.add( const IsLoading(false) );
    });
    Navigator.pop(context);

  }

  TapGestureRecognizer _registro() {
    return TapGestureRecognizer()..onTap = () {
      Navigator.pop(context);
    };
  }
}
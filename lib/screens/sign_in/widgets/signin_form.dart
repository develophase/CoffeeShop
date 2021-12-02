import 'package:coffee_shop/res.dart';
import 'package:coffee_shop/screens/password/enter_password/enter_password.dart';
import 'package:coffee_shop/values/function.dart';
import 'package:coffee_shop/values/size_config.dart';
import 'package:coffee_shop/values/validate.dart';
import 'package:coffee_shop/widgets/rounded_text_field.dart';
import 'package:coffee_shop/widgets/sign_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignForm extends StatefulWidget {
  SignForm({Key key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _txtPhone = TextEditingController();
  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _txtPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedTextField(
            controller: _txtPhone,
            hintText: 'Enter your phone number',
            label: 'Phone number',
            prefixIcon: Res.ic_phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: (value) => Validate.phoneValidate(value),
          ),
          SizedBox(height: SizeConfig.screenHeigh * 0.1),
          SignButton(
              text: 'Continue',
              onSubmit: () async {
                if (_formKey.currentState.validate()) {
                  hideKeyboard(context);
                  Navigator.of(context).pushNamed(EnterPassword.routeName,arguments: _txtPhone.text);
                }
              }),
        ],
      ),
    );
  }
}

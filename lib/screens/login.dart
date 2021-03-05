import 'package:flutter/material.dart';
import 'package:parxlab_project/helper/color_helper.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String sifre;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              elevation: 10,
              child: Container(
                height: size.height * .5,
                width: size.width * .85,
                decoration: BoxDecoration(
                  color: giris,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ParxLab',
                          style: TextStyle(fontSize: 30),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Kullanici Adı Girin");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                              labelText: "Kullanıcı Adı",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Şifre Girin");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            sifre = value;
                          },
                          decoration: InputDecoration(
                              labelText: "Parola",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                            },
                            color: butonRengi,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                  color: butonYazisi,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    ));
  }
}

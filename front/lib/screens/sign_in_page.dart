import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/screens/search_page.dart';
import 'package:servini_app/screens/sign_up_page.dart';
import '../main.dart';
import '../providers/signIn.dart';
import '../services/service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<SignInPage> createState() => _MySignInPage();
}

//te5edh objet profile mel base
class _MySignInPage extends State<SignInPage> {
  late SignInRequest signInRequest ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;

  @override
  void initState(){
    super.initState();
    signInRequest = SignInRequest();
  }

  @override
  Widget build(BuildContext context) {
    // if(token.isNotEmpty) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const SearchPage()),
    //   );
    // }
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: coldBackground,
          body: Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.07, 0, size.width * 0.07, 0),
              child: Form(
                key: globalFormKey,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.2),
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            color: darkRed,
                            fontSize: 50,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: size.height * 0.15),
                        TextFormField(
                          onSaved: (input) => signInRequest.email = input!,
                          controller: emailController,
                          style: const TextStyle(
                            color: writingBlue,
                          ),
                          decoration: InputDecoration(
                            labelText: "Enter your email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(height: size.height * 0.07),
                        TextFormField(
                          onSaved: (input) => signInRequest.password = input!,
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(
                            color: writingBlue,
                          ),
                          decoration: InputDecoration(
                            labelText: "Enter your password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => const SignUpPage()),
                              );
                            },
                            child: const Text(
                              "Don't have an account? Register",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontFamily: "Gilroy",
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(darkRed),
                          ),
                          onPressed: (){
                            setState(Null Function() param0){
                              passwordController.text="";
                              emailController.text="";
                            };
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });
                              APIService apiService = APIService();
                              print(signInRequest);
                              apiService.login(signInRequest).then((value) {
                                setState((){
                                  isApiCallProcess = false;
                                });
                                if (value.token.isNotEmpty) {
                                  token = value.token ;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (
                                        context) => const SearchPage()),
                                  );
                                }
                                else {
                                  const snackBar = SnackBar(
                                      content: Text("Verify your credentials"));
                                  scaffoldKey.currentState?.showSnackBar(snackBar);
                                }
                              });
                            };
                          },
                          child: Text("Enter"),
                        )
                      ],
                    ),
                  ],
                ),
              )
          )
      ),
      ),
    );
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

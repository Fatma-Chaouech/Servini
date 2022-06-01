import 'package:flutter/material.dart';
import 'package:servini_app/constants/colors.dart';
import 'package:servini_app/providers/signUp.dart';
import 'package:servini_app/screens/sign_in_page.dart';
import '../services/service.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _MySignUpPage();
}

//te5edh objet profile mel base
class _MySignUpPage extends State<SignUpPage> {
  late SignUpRequest signUpRequest ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;


  @override
  void initState(){
    super.initState();
    signUpRequest= SignUpRequest();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          currentFocus.unfocus();
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
                      SizedBox(height: size.height * 0.07),
                      const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: darkRed,
                            fontSize: 50,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.08),
                      TextFormField(
                        onSaved: (input) => signUpRequest.fullname = input!,
                        controller: nameController,
                        style: const TextStyle(
                          color: writingBlue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter your fullname",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        onSaved: (input) => signUpRequest.username = input!,
                        controller: usernameController,
                        style: const TextStyle(
                          color: writingBlue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter a username",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                       controller: emailController,
                        onSaved: (input) => signUpRequest.email = input!,
                        keyboardType: TextInputType.emailAddress,
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
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        controller: passwordController,
                        onSaved: (input) => signUpRequest.password = input!,
                        cursorColor: writingBlue,
                        cursorRadius: Radius.circular(16.0),
                        cursorWidth: 9.0,
                        obscureText: true,
                        style: const TextStyle(
                          color: writingBlue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Choose a password",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        controller: descController,
                        onSaved: (input) => signUpRequest.bio = input!,
                        style: const TextStyle(
                          color: writingBlue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Describe yourself",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      TextFormField(
                        controller: locationController,
                        onSaved: (input) => signUpRequest.location = input!,
                        cursorColor: writingBlue,
                        cursorRadius: Radius.circular(16.0),
                        cursorWidth: 9.0,
                        style: const TextStyle(
                          color: writingBlue,
                        ),
                        decoration: InputDecoration(
                          labelText: "Specify your location",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => const SignInPage()),
                            );
                          },
                          child: const Text(
                            "Already have an account? Sign In",
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
                        onPressed: () {
                          setState(Null Function() param0){
                            nameController.text="";
                            descController.text="";
                            passwordController.text="";
                            usernameController.text="";
                            locationController.text="";
                            emailController.text="";
                          };
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });
                            APIService apiService = APIService();
                            apiService.register(signUpRequest).then((value) {
                              setState((){
                                isApiCallProcess = false;
                              });
                              if (value.pass.isNotEmpty) {
                                const snackBar = SnackBar(
                                    content: Text("Successfully registered!"));
                                scaffoldKey.currentState?.showSnackBar(snackBar);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (
                                      context) => const SignInPage()),
                                );
                              }
                              else {
                                const snackBar = SnackBar(
                                    content: Text("Error",style: TextStyle(color: Colors.white),));
                                scaffoldKey.currentState?.showSnackBar(snackBar);
                              }
                            });
                          };
                        },
                        child: Text("Register",
                        style: TextStyle(
                          fontSize: 17,
                        ),),
                      ),
                      SizedBox(height: size.height * 0.05),
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

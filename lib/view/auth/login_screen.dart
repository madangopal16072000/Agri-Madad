import 'package:agri_app/constants.dart';
import 'package:agri_app/view/auth/singup_screen.dart';
import 'package:agri_app/view/homescreen.dart';
import 'package:agri_app/view/widgets/custom_button.dart';
import 'package:agri_app/view/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  late SMITrigger trigFail, trigSuccess;
  late SMIBool isChecking, isHandsUp;
  late Artboard? artboard;
  late SMINumber looknum;
  late StateMachineController? stateMachineController;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
    initArtBoard();
  }

  initArtBoard() {
    rootBundle.load(loginanimmationlink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine");
      if (stateMachineController != Null) {
        art.addController(stateMachineController!);

        for (var item in stateMachineController!.inputs) {
          print(item.name);
          if (item.name == 'isChecking') {
            isChecking = item as SMIBool;
          } else if (item.name == 'isHandsUp') {
            isHandsUp = item as SMIBool;
          } else if (item.name == 'trigFail') {
            trigFail = item as SMITrigger;
          } else if (item.name == 'trigSuccess') {
            trigSuccess = item as SMITrigger;
          } else if (item.name == 'numLook') {
            looknum = item as SMINumber;
          }
        }
      }

      setState(() {
        artboard = art;
      });
    });
  }

  void checking() {
    isChecking.change(true);
    isHandsUp.change(false);

    looknum.change(0);
  }

  void moveeyes(String value) {
    looknum.change(value.length.toDouble());
  }

  void handsup() {
    isChecking.change(false);
    isHandsUp.change(true);
  }

  void login() {
    isHandsUp.change(false);
    isChecking.change(false);
    if (_emailcontroller.text == 'k' && _passwordcontroller.text == 'k') {
      trigSuccess.fire();
    } else {
      trigFail.fire();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 3),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 81,
                    ),
                    Text(
                      "Agri Madad",
                      style: TextStyle(
                        fontSize: 35,
                        //fontWeight: FontWeight.w600,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Lottie.asset('assets/plant_walk.json',
                        height: 81, width: 82),
                    //  ),
                  ],
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                if (artboard != Null)
                  SizedBox(
                    width: 240,
                    height: 240,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Rive(artboard: artboard!),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextField(
                    onTap: checking,
                    onChanged: ((value) => moveeyes(value)),
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  child: TextInputField(
                    ontap: handsup,
                    controller: _passwordcontroller,
                    labeltext: "Password",
                    icon: Icons.lock,
                    isobscure: true,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  title: 'Login',
                  ontap: () {
                    authController.loginUser(
                        _emailcontroller.text, _passwordcontroller.text);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Get.offAll(LoginScreen());
                        Get.offAll(SignUpScreen());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 20,
                            color: color4,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

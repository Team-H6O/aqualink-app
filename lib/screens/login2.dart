import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';

void main() {
  runApp(const Login2());
}

class Login2 extends StatelessWidget {
  const Login2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Login2Page(title: 'Login2'),
    );
  }
}

class Login2Page extends StatefulWidget {
  const Login2Page({super.key, required this.title});

  final String title;

  @override
  State<Login2Page> createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                          color: Color(0xFF98FF8C),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 125,
                                  height: 125,
                                  decoration: BoxDecoration(
                                    color: AppTheme.nearWhiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        'https://picsum.photos/seed/382/600',
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login to',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      'Aqualink',
                                      style: Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: Color(0xFFBBCEFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              // controller: _model.textController1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: Theme.of(context).textTheme.headline6,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                              ),
                              style: Theme.of(context).textTheme.headline3,
                              // validator: _model.textController1Validator
                              //     .asValidator(context),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: TextFormField(
                                // controller: _model.textController2,
                                autofocus: true,
                                // obscureText: !_model.passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: Theme.of(context).textTheme.headline3,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                  // suffixIcon: InkWell(
                                    // onTap: () => setState(
                                    //   () => _model.passwordVisibility =
                                    //       !_model.passwordVisibility,
                                    // ),
                                    // focusNode: FocusNode(skipTraversal: true),
                                    // child: Icon(
                                    //   _model.passwordVisibility
                                    //       ? Icons.visibility_outlined
                                    //       : Icons.visibility_off_outlined,
                                    //   color: Color(0xFF757575),
                                    //   size: 22,
                                    // ),
                                  // ),
                                ),
                                style: Theme.of(context).textTheme.headline3,
                                // validator: _model.textController2Validator
                                //     .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFFF5F5F5),
                                        ),
                                        child: Checkbox(
                                          value: true,// value: _model.checkboxValue ??= true,
                                          onChanged: (newValue) async {
                                            // setState(() => _model
                                            //     .checkboxValue = newValue!);
                                          },
                                          activeColor:
                                              AppTheme.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        'Remember me',
                                        style: Theme.of(context).textTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Forget your password ?',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: ElevatedButton(
  onPressed: () {
    print('Button pressed ...');
  },
  child: Text('Sign In'),
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 45),
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    backgroundColor: AppTheme.darkPrimaryColor,
    textStyle: const TextStyle(
      fontSize: AppTheme.headline6Size,
    ),
    elevation: 2,
    side: BorderSide(color: Color(0x00FFFFFF)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
)
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 40, 60, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.google,
                                          color: Color(0xFFFF5252),
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF1877F2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.facebookF,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.apple,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

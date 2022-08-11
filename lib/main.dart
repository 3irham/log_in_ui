import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:log_in_ui/next_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: ListView(
          padding: const EdgeInsets.only(left: 40, right: 40),
          children: [
            Form(
              key: formKey, //key for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    "Here to Get",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  Text(
                    "Welcomed !",
                    style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return 'Please enter a correct name';
                        }
                        return null;
                      }),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your phone number',
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value)) {
                          return 'Please enter a correct phone number';
                        }
                        return null;
                      }),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}')
                              .hasMatch(value)) {
                        return 'Please enter a correct email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                      obscuringCharacter: "*",
                      obscureText: !_passwordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                .hasMatch(value)) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (value is String) {
                              return 'Enter valid password uniquelly';
                            } else {
                              return null;
                            }
                          }
                        }
                      }),
                  SizedBox(height: height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                        label: Text("Sign in"),
                      ),
                      NeumorphicButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          }
                          // if (formKey.currentState!.validate()) {
                          //   final snackBar =
                          //       SnackBar(content: Text('Form submitted'));
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                        },
                        child: Icon(Icons.done, color: Colors.white, size: 30),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.circle(),
                          color: Colors.blue,
                          depth: 50,
                          border: NeumorphicBorder(
                            color: Colors.blue,
                            width: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import '../konstants.dart';
import 'home_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

TextEditingController nameController = TextEditingController();

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    bool textfieldCheck() {
      String name;

      name = nameController.text;

      if (name == '') {
        return true;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              name: name,
            ),
          ),
        );
        return false;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: EdgeInsets.only(
          left: 10 * (deviceWidth(context) / 100),
          right: 10 * (deviceWidth(context) / 100),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15 * (deviceHeight(context) / 100),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bienvenue !',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 50),
              ),
              //* Phone Number Field

              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  maxLength: 14,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    labelText: 'Nom',
                    labelStyle: TextStyle(
                      color: Colors.teal,
                    ),
                    helperText: 'Saisir votre nom',
                    helperStyle: TextStyle(
                      color: Colors.blueGrey[900],
                    ),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.teal,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          nameController.text = '';
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[900]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20 * (deviceHeight(context) / 100),
              ),
              SizedBox(
                child: IconButton(
                  iconSize: 60,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    textfieldCheck();
                  },
                ),
              ),
              SizedBox(
                height: 18 * (deviceHeight(context) / 100),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made with',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

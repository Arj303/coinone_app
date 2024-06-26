import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_providers.dart';
import 'loginpage.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

  final TextEditingController name1 = TextEditingController();
  final TextEditingController email1 = TextEditingController();
  final TextEditingController number1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<UserController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Create Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(height: 20,),
                  Text("Add your profile information",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField( decoration: InputDecoration(labelText: 'Name'),controller: name1,),
                  TextFormField( decoration: InputDecoration(labelText: 'Email'),controller: email1,),
                  TextFormField( decoration: InputDecoration(labelText: 'Phone number'),controller: number1,),
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  onPressed: (){
                    controller.addUser(name1.text, email1.text, number1.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  color: Color(0xff0095FF),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff0095FF),
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),


                ),



              ),


            ],

          ),


        ),

      ),

    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'globels.dart';
import 'model_class.dart';

class Edit_Page extends StatefulWidget {
  const Edit_Page({Key? key}) : super(key: key);

  @override
  State<Edit_Page> createState() => _Edit_PageState();
}

class _Edit_PageState extends State<Edit_Page> {
  GlobalKey<FormState> _editcontactkey = GlobalKey<FormState>();

  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _phonenumbercontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  String? _firstname;
  String? _lastname;
  String? _phonenumber;
  String? _email;
  File? _image;

  TextStyle mystyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    _firstnamecontroller.text = data.firstname;
    _lastnamecontroller.text = data.lastname;
    _phonenumbercontroller.text = data.phonenumber;
    _emailcontroller.text = data.email;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add",
          style:
              TextStyle(color: (AppTheme.isDark) ? Colors.white : Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();

            _firstnamecontroller.clear();
            _lastnamecontroller.clear();
            _phonenumbercontroller.clear();
            _emailcontroller.clear();

            setState(() {
              _firstname = "";
              _lastname = "";
              _phonenumber = "";
              _email = "";
            });
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (_editcontactkey.currentState!.validate()) {
                  _editcontactkey.currentState!.save();

                  Contact c = Contact(
                    firstname: _firstname,
                    lastname: _lastname,
                    phonenumber: _phonenumber,
                    email: _email,
                    image: _image,
                  );

                  int i = Global.allcontacts.indexOf(data);

                  Global.allcontacts[i] = (c);

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('homepage', (route) => false);
                }
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Form(
        key: _editcontactkey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "First Name",
                  style: mystyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _firstnamecontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your First Name...";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _firstname = val;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "First Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Last Name",
                  style: mystyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _lastnamecontroller,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your Last Name...";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _lastname = val;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Last Name"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Phone Number",
                  style: mystyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _phonenumbercontroller,
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your Number...";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _phonenumber = val;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "+91 0000000000"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: mystyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Your Email..";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      _email = val;
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:contact_diry/screens/globels.dart';
import 'package:contact_diry/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style:
              TextStyle(color: (AppTheme.isDark) ? Colors.white : Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(
                flex: 8,
              ),
              CircleAvatar(
                backgroundImage:
                    (res.image != null) ? FileImage(res.image!) : null,
                backgroundColor: Colors.grey,
                radius: 55,
                child: Text(
                  (res.image != null) ? "" : "ADD",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              IconButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: const Text('Are You Sure...'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(dialogContext)
                                    .pop(); // Dismiss alert dialog
                              },
                            ),
                            TextButton(
                              child: const Text('yes'),
                              onPressed: () {
                                Global.allcontacts.remove(res);

                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'homepage', (route) => false);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    Global.allcontacts.remove(res);

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  icon: const Icon(Icons.delete)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('editpage', arguments: res);
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "${res.firstname} ${res.lastname}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "+91 ${res.phonenumber} ",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () async {
                  Uri url = Uri.parse("tel:+91${res.phonenumber}");

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Can't be launched..."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                heroTag: null,
                mini: true,
                backgroundColor: Colors.green,
                child: const Icon(Icons.call),
              ),
              FloatingActionButton(
                onPressed: () async {
                  Uri url = Uri.parse("sms:+91${res.phonenumber}");

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Can't be launched..."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                heroTag: null,
                mini: true,
                backgroundColor: Colors.amber,
                child: const Icon(Icons.message),
              ),
              FloatingActionButton(
                onPressed: () async {
                  Uri url =
                      Uri.parse("mailto:${res.email}?subject=Demo&body=Hello");

                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Can't be launched..."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                heroTag: null,
                mini: true,
                backgroundColor: Colors.lightBlueAccent,
                child: const Icon(Icons.email_outlined),
              ),
              FloatingActionButton(
                onPressed: () async {
                  await Share.share(
                      "Name: ${res.firstname} ${res.lastname}\n+91 ${res.phonenumber}");
                },
                heroTag: null,
                mini: true,
                backgroundColor: Colors.deepOrangeAccent,
                child: const Icon(Icons.share),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

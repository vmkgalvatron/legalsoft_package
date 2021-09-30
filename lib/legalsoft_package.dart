library legalsoft_package;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PermissionPolicyDialog {
  List<bool> perms;
  String appId;
  final List<Map<String, dynamic>> _perms = [
    {'icon': Icons.mic, 'title': 'Microphone'},
    {'icon': Icons.camera, 'title': 'Camera'},
    {'icon': Icons.location_on, 'title': 'Location'},
    {'icon': Icons.storage, 'title': 'Storage'},
    {'icon': Icons.call, 'title': 'Call'},
    {'icon': Icons.contacts, 'title': 'Contacts'}
  ];
  late String _url = 'https://legalsoft.netlify.app/privacy/';
  PermissionPolicyDialog(this.appId, this.perms);

  Future show(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'In order to work properly app needs following permissions.',
                    ),
                  ),
                  Divider(
                    thickness: 1.7,
                    color: Colors.grey[500],
                  ),
                  for (int i = 0; i < 6; i++)
                    if (perms[i])
                      ListTile(
                        leading: Icon(_perms[i]['icon']),
                        title: Text(_perms[i]['title']),
                      ),
                  Divider(
                    thickness: 1.7,
                    color: Colors.grey[500],
                  ),
                  TextButton(
                    child: const Text(
                      'Privacy Policy',
                    ),
                    onPressed: () async {
                      await canLaunch(_url + appId)
                          ? await launch(_url + appId)
                          : throw 'Could not launch $_url+$appId';
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
}

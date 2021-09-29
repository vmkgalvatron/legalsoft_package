library legalsoft_package;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PermissionPolicyDialog extends StatefulWidget {
  List<bool> perms;
  String appId;
  PermissionPolicyDialog(this.appId, this.perms);

  @override
  _PermissionPolicyDialogState createState() => _PermissionPolicyDialogState();
}

class _PermissionPolicyDialogState extends State<PermissionPolicyDialog> {
  List<Map<String, dynamic>> _perms = [
    {'icon': Icons.mic, 'title': 'Microphone'},
    {'icon': Icons.camera, 'title': 'Camera'},
    {'icon': Icons.location_on, 'title': 'Location'},
    {'icon': Icons.storage, 'title': 'Storage'},
    {'icon': Icons.call, 'title': 'Call'},
    {'icon': Icons.contacts, 'title': 'Contacts'}
  ];
  String _url = 'flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 6; i++)
              if (widget.perms[i])
                ListTile(leading: _perms[i]['icon'], title: _perms[i]['title']),
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                child: Text(
                  'Privacy Policy',
                ),
                onPressed: () async {
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

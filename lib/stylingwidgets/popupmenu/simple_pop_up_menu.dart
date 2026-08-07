import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimplePopUpMenu extends StatelessWidget {
  const SimplePopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop Up menu demo'),
        actions: [
          PopupMenuButton<String>(
            //with a simple value / snackbar
            // onSelected: (String value) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text('you have selected : $value')),
            //   );
            // },
            //with case
            onSelected: (String value) {
              switch (value) {
                case 'profile':
                  print('PROFILEEEEEEEEE');
                  break;
                case 'settings':
                  print('SETTINGSSSS');
                  break;
                case 'Logout':
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('LOG TF OUTTTTTTTTT')));
                  break;
              }
            },

            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('view profile'),
              ),
              PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('view settings'),
              ),
              PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('LOGOUT'),
              ),
            ],
          ),
        ],
      ),
      body: Center(child: Text('Tap three dots in appbar')),
    );
  }
}

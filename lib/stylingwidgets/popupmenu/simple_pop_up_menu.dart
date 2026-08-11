import 'package:flutter/material.dart';

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
                child: Row(children: [
                  Icon(Icons.person),
                  SizedBox(width: 8,),
                Text('view profile'),
         ] )),
              PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('view settings'),
                  ],
                ),
              ),
              PopupMenuDivider(),
              const PopupMenuItem<String>(
                
                value: 'Logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8,),
                    Text('LOGOUT')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(child: Text('Tap three dots in appbar')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopupMenuWithBottomShhet extends StatelessWidget {
  const PopupMenuWithBottomShhet({super.key});
  void _showProfileDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'User details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text('Username: user_123'),
              const Text('Email: user@example.com'),
              const Text('Role: Developer'),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

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
                  _showProfileDetails(context);
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

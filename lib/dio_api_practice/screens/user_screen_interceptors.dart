import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_flutter/dio_api_practice/models/user.dart';
import 'package:navigation_flutter/dio_api_practice/services/interceptors.dart';

class UserScreenInterceptors extends StatelessWidget {
  final ApiService2 _apiService2 = ApiService2();
  UserScreenInterceptors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text(
          'Interceptors Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: _apiService2.fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error , ${snapshot.error}'));
          }
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,

            itemBuilder: (context, index) {
              final user = users[index];
              return GestureDetector(
                onTap: () {
                  context.push('/detailscreen2', extra: user);
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          '${user.id}. ${user.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          user.email,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          user.company.name,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          user.address.city,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('username');
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  Widget _buildMenuItem(String title, IconData icon, String route, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header dengan data user yang dinamis
          FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final prefs = snapshot.data!;
                final username = prefs.getString('username') ?? 'User';
                final email = prefs.getString('email') ?? '$username@university.ac.id';
                
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.blue[700],
                      size: 40,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                  ),
                );
              }
              return UserAccountsDrawerHeader(
                accountName: const Text("User"),
                accountEmail: const Text("Loading..."),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue[700],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                ),
              );
            },
          ),
          
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem('Beranda', Icons.home, '/home', context),
                _buildMenuItem('Form Data', Icons.person_add, '/form', context),
                _buildMenuItem('Profil Saya', Icons.person, '/profile', context),
                _buildMenuItem('Tentang', Icons.info, '/about', context),
                
                const Divider(thickness: 1),
                
                // Logout Button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Keluar', style: TextStyle(color: Colors.red)),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
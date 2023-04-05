import 'package:first_try/screen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> chatList = [
    'Sachin Tendulkar',
    'Neymar Jr',
    'Smrithi Mandhana',
    'Virat Kohli',
    'Rohit Sharma',
    'Harmanpreet Kaur',
    'Lionel Messi',
    'Yuvraj Singh',
    'Cristiano Ronaldo',
    'M S Dhoni',
    'Sergio Ramos',
    'Pele',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              confirmation(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return ListTile(
                  title: Text(
                    chatList[index],
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text('India',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 55,
                    ),
                    child: Image(
                        image: AssetImage('assets/images/image$index.jpg')),
                  ));
            } else {
              return ListTile(
                title: Text(
                  chatList[index],
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/image$index.jpg'),
                ),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
          itemCount: chatList.length,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }

  confirmation(BuildContext context) async {
    return showDialog(
      
      
      context: context,
      builder: (ctx1) {
        return AlertDialog(
          
          
          title: const Text(
              style: TextStyle(
                color: Color.fromARGB(255, 5, 5, 5),
                fontSize: 36,
              ),
              'Log out'),
          content: const Text('You will be returned to login screen'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx1).pop();
              },
              child: const Text(
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  'Cancel'),
            ),
            TextButton(
              onPressed: () => signout(context),
              child: const Text(
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  'Log out'),
            ),
          ],
        );
      },
    );
  }
}

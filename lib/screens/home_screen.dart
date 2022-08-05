import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildNote(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Note Title'),
            subtitle: Text('Aug 16 2022 - High'),
            trailing: Checkbox(
              onChanged: ( value) {
                print(value);
              },
              activeColor: Theme.of(context).primaryColor,
              value: true,
            ),
          ),
          const Divider(height: 5.0, color: Colors.deepPurple, thickness: 1.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, int index) {
          if (index == 0) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My Notes',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '0 of 10',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
            );
          }
          return _buildNote(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/add_note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

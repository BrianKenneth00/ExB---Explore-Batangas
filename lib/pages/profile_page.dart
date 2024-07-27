import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = 'Nathalie Ellaina Anicas';
  String username = '@nathalieanicas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 53, 122, 110),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5),
              CircleAvatar(
                radius: 50, // Adjust size as needed
                backgroundImage: AssetImage('images/nathalie.jpeg'), // Reference your image here
              ),
              SizedBox(height: 10),
              Text(
                fullName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Divider(),
              SizedBox(height: 20),
              Text(
                'My Reviews',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildReviewCard(
                    context,
                    'J Castle Theme Park',
                    'Visited on 2022-01-10',
                    4,
                    'Great place for family fun! The rides were awesome and the staff was friendly.',
                  ),
                  _buildReviewCard(
                    context,
                    'Masasa Beach, Tingloy',
                    'Visited on 2021-12-20',
                    5,
                    'Amazing diving experience! The coral reefs were breathtaking, and the water was crystal clear.',
                  ),
                  _buildReviewCard(
                    context,
                    'Caleruega Church',
                    'Visited on 2021-11-05',
                    3,
                    'Beautiful architecture, but the place was quite crowded. Still worth a visit.',
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Account Settings'),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSettingsPage(fullName: fullName, username: username)),
                  );
                  if (result != null) {
                    setState(() {
                      fullName = result['fullName'];
                      username = result['username'];
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, String title, String visitDate, int rating, String comment) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(visitDate),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
              );
            }),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(comment),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }
}

class AccountSettingsPage extends StatefulWidget {
  final String fullName;
  final String username;

  AccountSettingsPage({required this.fullName, required this.username});

  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: widget.fullName);
    _usernameController = TextEditingController(text: widget.username);
  }

  void _saveProfile() {
    String fullName = _fullNameController.text;
    String username = _usernameController.text;

    Navigator.pop(context, {'fullName': fullName, 'username': username});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 67, 156, 141),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Personal Information'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Edit Picture'),
                    trailing: Icon(Icons.photo_camera),
                    onTap: () {
                      // Implement profile picture upload/change functionality
                    },
                  ),
                  TextField(
                    controller: _fullNameController,
                    decoration: InputDecoration(labelText: 'Full Name'),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

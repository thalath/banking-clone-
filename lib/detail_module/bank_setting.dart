import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 82, 106),
      appBar: AppBar(title: Text("ABA' Setting")),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 240, // Define the size of the area
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/thalath.jpg', // The original image at the bottom
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(60),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 179, 16, 16),
                        width: 5.0,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/thalath.jpg'),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 180,
                  left: 145,
                  child: Text(
                    "Tun Thalath",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 155,
                  child: Text(
                    "App ID: 3101687",
                    style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),

                    Text(
                      "Bank' Setting",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 69, 205),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Thalath",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 9),
                        Text(
                          "You can make conversations here!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xfff8f5fa),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Text(
                              "Learn more",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 31, 69, 205),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.account_circle_sharp),
                      title: Text(
                        "Profile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(CupertinoIcons.greaterthan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.lock),
                      title: Text(
                        "Security",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(CupertinoIcons.greaterthan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: Icon(CupertinoIcons.globe),
                      title: Text(
                        "Language",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(CupertinoIcons.greaterthan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: Icon(CupertinoIcons.phone_solid),
                      title: Text(
                        "Content Us",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(CupertinoIcons.greaterthan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: ListTile(
                      leading: Icon(CupertinoIcons.square_list),
                      title: Text(
                        "Terms & Conditions",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(CupertinoIcons.greaterthan),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 9,
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 8,
                          child: Opacity(
                            opacity: 0.5, // watermark effect
                            child: Icon(
                              Icons.local_florist,
                              size: 40,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                        SwitchListTile(
                          secondary: Icon(Icons.lock_outline),
                          title: Text(
                            'Bank Merchart Mode',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: _isOn,
                          onChanged: (value) {
                            setState(() {
                              _isOn = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

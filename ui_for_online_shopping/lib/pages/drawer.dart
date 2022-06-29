import 'package:flutter/material.dart';

Widget myDrawer(BuildContext context){
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(accountName: Text("Name"), accountEmail: Text("Email"),
            // otherAccountsPictures: [
            //   UserAccountsDrawerHeader(accountName: Text("data"), accountEmail: Text("data"))
            // ],
            currentAccountPicture: CircleAvatar(
              child: Text("P"
              ,style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            //onTap: (){}
            leading: Icon(Icons.list),
            title: Text("My Order"),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          )
          
        ],
      ),
    );
}
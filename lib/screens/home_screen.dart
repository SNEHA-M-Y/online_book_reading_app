import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_book_reading_app/core/constants.dart';
import 'package:online_book_reading_app/screens/bookinfo_screen.dart';
import 'package:online_book_reading_app/screens/search_screen.dart';
import 'package:online_book_reading_app/screens/signin_screen.dart';
import 'package:online_book_reading_app/services/homebook_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeBookProvider>(context, listen: false).fetchBooks("fiction");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenSearch(),
                  ),
                );
              },
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ))
        ],
      ),
      drawer: Consumer<HomeBookProvider>(
        builder: (context, value, child) {
          return NavigationDrawer(
            children: [
              ListTile(
                leading: Icon(Icons.book_online_outlined),
                title: Text("Fiction"),
                onTap: () {
                  value.refreshHome(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.book_online_outlined),
                title: Text("Non-Fiction"),
                onTap: () {
                  value.refreshHome(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.book_online_outlined),
                title: Text("Science"),
                onTap: () {
                  value.refreshHome(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.book_online_outlined),
                title: Text("History"),
                onTap: () {
                  value.refreshHome(3);
                },
              ),
              SizedBox(
                height: 300,
              ),
              ListTile(
                title: Text("Sign Out"),
                leading: Icon(Icons.logout_outlined),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((onValue) {
                    log("Signed Out");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  });
                },
              )
            ],
            backgroundColor: Colors.white70,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 250,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CustomBookCardWidget(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomBookCardWidget extends StatelessWidget {
  const CustomBookCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBookProvider>(
      builder: (context, value, child) {
        String? thumbnailimage =
            value.homeBooks?.items![index].volumeInfo!.imageLinks!.thumbnail;
        thumbnailimage ??= imagenotavailable;
        return InkWell(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            thumbnailimage,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Text(
                  "unknown data",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value.homeBooks!.items![index].volumeInfo!.authors.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenBookInfo(),
              ),
            );
          },
        );
      },
    );
  }
}

























// Center(
//       child: ElevatedButton(
//           onPressed: () {
//             FirebaseAuth.instance.signOut().then((onValue) {
//               log("Signed Out");
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SignInScreen(),
//                 ),
//               );
//             });
//           },
//           child: Text("Log Out")),
//     );
import 'package:flutter/material.dart';
import 'package:online_book_reading_app/core/constants.dart';
import 'package:online_book_reading_app/screens/bookinfo_screen.dart';
import 'package:online_book_reading_app/services/searchprovider.dart';
import 'package:provider/provider.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchvaluecontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          SizedBox(
            height: 30,
            width: 200,
            child: Consumer<SearchProvider>(
              builder: (context, value, child) {
                return TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                    enabled: true,
                    hintText: "Search your favourites...",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                  onEditingComplete: () {
                    value.SearchAccess(searchvaluecontroller.text);
                  },
                  controller: searchvaluecontroller,
                );
              },
            ),
          )
        ],
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
    return Consumer<SearchProvider>(
      builder: (context, value, child) {
        String? thumbnailimage = value
            .searchingBooks!.items![index].volumeInfo!.imageLinks?.thumbnail;

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
                      ),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Text(
                  value.searchingBooks!.items![index].volumeInfo!.title ??
                      "unknown data",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value.searchingBooks!.items![index].volumeInfo!.authors
                      .toString(),
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

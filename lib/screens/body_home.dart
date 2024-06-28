import 'package:flutter/material.dart';
import 'package:sample/data/data.dart';
import 'package:sample/widgets/widget.dart';

class MyHomeBody extends StatelessWidget {
  const MyHomeBody({
    super.key,
    required this.person,
  });

  final Person person;

  List<String> extractFirstNames(List<String> fullNames) {
    List<String> firstNames = [];
    for (var name in fullNames) {
      String firstName = name.split(' ')[0];
      firstNames.add(firstName);
    }
    return firstNames;
  }

  @override
  Widget build(BuildContext context) {
    List<String> firstNames = extractFirstNames(person.names);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 197, 197, 197)),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // search func
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 150.0,
                  child: ListView.builder(
                    itemCount: person.image.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MyCircleContainer(
                        image: person.image[index],
                        text: firstNames[index],
                      );
                    },
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MyListTile(
                      image: person.image[index],
                      text: person.names[index],
                      subtitle: person.messages[index],
                      onTap: () {
                        Navigator.pushNamed(context, '/second',
                            arguments: ScreenArgs(
                                person.names[index], person.image[index]));
                      },
                    );
                  },
                  itemCount: person.names.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

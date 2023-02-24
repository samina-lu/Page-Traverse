// Import the required packages
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<String> _suggestions = [];

  Future<List<String>> _getSuggestions(String query) async {
    // Use the query to search for matching files in Firebase Cloud Storage
    final storage = FirebaseStorage.instance;

    final ListResult result = await storage.ref().listAll();
    final matches = result.items
        .where((ref) => ref.name.toLowerCase().contains(query.toLowerCase()))
        .map((ref) => ref.name)
        .toList();

    return matches;
  }

  void _onSearchChanged(String value) async {
    if (value.length < 2) {
      return;
    }

    final suggestions = await _getSuggestions(value);

    setState(() {
      _suggestions = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search',
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_suggestions[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}























// import 'package:flutter/material.dart';

// List<String> suggestionsList = [
//   'apple',
//   'banana',
//   'cherry',
//   'date',
//   'elderberry',
//   'fig',
//   'grape',
//   'honeydew',
//   'imbe',
//   'jackfruit',
//   'kiwi',
//   'lemon',
//   'mango',
//   'nectarine',
//   'orange',
//   'pear',
//   'quince',
//   'raspberry',
//   'strawberry',
//   'tangerine',
//   'ugli fruit',
//   'vanilla bean',
//   'watermelon',
//   'xigua (Chinese watermelon)',
//   'yellow watermelon',
//   'zucchini'
// ];

// class AutoSuggestTextField extends StatefulWidget {
//   @override
//   _AutoSuggestTextFieldState createState() => _AutoSuggestTextFieldState();
// }

// class _AutoSuggestTextFieldState extends State<AutoSuggestTextField> {
//   String _searchQuery = '';
//   List<String> _filteredSuggestions = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                   _filteredSuggestions = suggestionsList
//                       .where((suggestion) => suggestion
//                           .toLowerCase()
//                           .startsWith(_searchQuery.toLowerCase()))
//                       .toList();
//                 });
//               },
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: _filteredSuggestions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_filteredSuggestions[index]),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

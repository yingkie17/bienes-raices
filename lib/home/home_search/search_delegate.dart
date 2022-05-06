import 'package:flutter/material.dart';

class PropiedadSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Propiedad';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('BuildResults : $query');
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
            child: Icon(
          Icons.house,
          color: Colors.indigo,
          size: 200,
        )),
      );
    }

    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

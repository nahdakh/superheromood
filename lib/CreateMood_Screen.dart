import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/hero.dart';

class CreateMoodsScreen extends StatefulWidget {
  @override
  _CreateMoodsScreenState createState() => _CreateMoodsScreenState();
}

class _CreateMoodsScreenState extends State<CreateMoodsScreen> {
  final _moodController = TextEditingController();

  Future<HeroData> getData() async {
    final response = await http.get(Uri.parse(
        'https://www.superheroapi.com/api.php/4106db72435939cd66067c585cc960ff/search/batman'));

    if (response.statusCode == 200) {
      return HeroData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load HeroData');
    }
  }

  @override
  void dispose() {
    _moodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Moods'),
      ),
      body: FutureBuilder<HeroData>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.results.length,
              itemBuilder: (BuildContext context, int index) {
                var heroesData = snapshot.data!.results[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: null,
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          height: 300.0,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(heroesData.img),
                              Text(
                                heroesData.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomSheet: Card(
        child: ListTile(
          leading: Text(
            'Moods',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          title: TextField(
            controller: _moodController,
          ),
          trailing: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

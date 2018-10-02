import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text("Types", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((t) => FilterChip(
                                backgroundColor: Colors.amber,
                                label: Text(t),
                                onSelected: (b) {},
                              ))
                          .toList()),
                  Text("Weakness",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((t) => FilterChip(
                                backgroundColor: Colors.red,
                                label: Text(t,
                                    style: TextStyle(color: Colors.white)),
                                onSelected: (b) {},
                              ))
                          .toList()),
                  Text("Next Evolution",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution == null
                          ? [
                              FilterChip(
                                backgroundColor: Colors.grey,
                                label: Text("None"),
                                onSelected: (b) {},
                              )
                            ]
                          : pokemon.nextEvolution
                              .map((n) => FilterChip(
                                    backgroundColor: Colors.green,
                                    label: Text(n.name),
                                    onSelected: (b) {},
                                  ))
                              .toList())
                ]),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 170.0,
                  width: 170.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
                )))
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}
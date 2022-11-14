// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dificulty_level.dart';

class Task extends StatefulWidget {
  Task({
    Key? key,
    required this.tarefa,
    required this.img,
    required this.dificulty,
  }) : super(key: key);
  final String tarefa;
  final String img;
  final int dificulty;

  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int dificultyCounter = 0;

  Color colorSet() {
    if (dificultyCounter == 1) {
      return const Color.fromARGB(255, 19, 167, 0);
    } else if (dificultyCounter == 2) {
      return const Color.fromARGB(255, 207, 149, 67);
    } else if (dificultyCounter >= 3) {
      return const Color.fromARGB(255, 43, 48, 108);
    }
    return Colors.blue;
  }

  bool assetOrigin() {
    if (widget.img.contains('http')) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: colorSet(),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 4.0),
                      color: Colors.black.withOpacity(.80),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 80),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 8),
                                width: 110,
                                child: Text(
                                  widget.tarefa,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.fade),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 8),
                                child:
                                    Dificulty(dificultyLevel: widget.dificulty),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 24),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: colorSet(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                setState(() {
                                  widget.nivel++;
                                  if (((widget.nivel / widget.dificulty) / 10) >= 1) {
                                    dificultyCounter++;
                                    widget.nivel = 0;
                                  }
                                  if (dificultyCounter >= 4) {
                                    widget.nivel = 99;
                                  }
                                });
                              },
                              child: const FaIcon(FontAwesomeIcons.caretUp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 10),
            height: 120,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0.0, 2.0),
                  color: Colors.black.withOpacity(.80),
                  blurRadius: 7,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: assetOrigin()
                  ? Image.network(widget.img, fit: BoxFit.cover)
                  : Image.asset(widget.img, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3,
            bottom: 12.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (widget.nivel < 99)
                    ? Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.white60,
                            value: (widget.dificulty > 0)
                                ? ((widget.nivel / widget.dificulty) / 10)
                                : 1.0,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 18),
                        Text(
                          'Lvl: ${widget.nivel}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ])
                    : const Text('MAESTRIA MÁXIMA ATINGIDA. PARABÉNS!',
                        style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

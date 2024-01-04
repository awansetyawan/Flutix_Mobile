part of 'pages.dart';

class PlaceAndTimePick extends StatefulWidget {
  const PlaceAndTimePick({super.key});

  @override
  State<PlaceAndTimePick> createState() => _PlaceAndTimePickState();
}

class _PlaceAndTimePickState extends State<PlaceAndTimePick> {
  final List<bool> _selectionsCinema = List.generate(6, (index) => false);
  final List<bool> _selectionsDay = List.generate(7, (index) => false);
  final List<bool> _selectionsTime = List.generate(8, (index) => false);

  final List<String> _location = [
    'BIG MALL PREMIERE',
    'BIG MALL XXI',
    'SCP PREMIERE',
    'SCP XXI',
    'PLAZA MULIA CGV',
    'CITY CENTRUM XXI',
  ];

  final List<String> _day = [
    'SENIN',
    'SELASA',
    'RABU',
    'KAMIS',
    'JUMAT',
    'SABTU',
    'MINGGU',
  ];

  final List<String> _time = [
    '08:00',
    '16:00',
    '10.00',
    '18.00',
    '12.00',
    '20.00',
    '14.00',
    '22.00',
  ];

  final ScrollController _scrollContollerOne = ScrollController();
  final ScrollController _scrollContollerTwo = ScrollController();
  final ScrollController _scrollContollerThree = ScrollController();

  bool uploadPressed = false;
  bool backPressed = false;
  bool checkSelected = false;

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var w = MediaQuery.of(context).size.width - 50;
    var h = MediaQuery.of(context).size.height - 257;
    Ticket ticket = Provider.of<TicketData>(context, listen: false).ticket!;

    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      body: Column(
        children: [
          // Konten Atas
          Container(
            height: 100,
            width: lebar,
            decoration: BoxDecoration(
              color: const Color(0xFF393E46),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.3), // Warna shadow dengan tingkat transparansi
                  blurRadius: 2, // Lebar blur
                  spreadRadius: 1, // Lebar penyebaran shadow
                  offset: const Offset(0, 2), // Posisi shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0,
                      top:
                          35.0), // Ubah nilai left sesuai dengan jumlah padding yang diinginkan
                  child: Text(
                    ticket.film.title!,
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xFFFFDF00),
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0,
                      top:
                          7.0), // Ubah nilai left sesuai dengan jumlah padding yang diinginkan
                  child: Text(
                    ticket.film.genres!.join(", "),
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Konten Scroll 1
          const Padding(
            padding: EdgeInsets.only(
                top:
                    20.0), // Ubah nilai left sesuai dengan jumlah padding yang Anda inginkan
            child: Text(
              "Cinema",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFFFFDF00),
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: w,
            height: (h * 2 / 3.5) * 2.5 / 6.5,
            child: RawScrollbar(
              controller: _scrollContollerOne,
              thumbVisibility: true,
              trackVisibility: false,
              thickness: 4,
              thumbColor: const Color(0xFFFFDF00),
              radius: const Radius.circular(20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollContollerOne,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 1),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        children: [
                          Positioned(
                            // Positioned sebagai latar belakang
                            top: 5.0,
                            left: 10.0,
                            child: Container(
                              width: constraints.maxWidth - 30,
                              height: constraints.maxHeight,
                              color: const Color(
                                  0xFFFFDF00), // Warna latar belakang container
                            ),
                          ),
                          ToggleButtons(
                            constraints: BoxConstraints.expand(
                              width: constraints.maxWidth - 30,
                              height: constraints.maxHeight - 8,
                            ),
                            color: Colors.white,
                            borderColor: const Color(0xFF969696),
                            borderWidth: 1,
                            fillColor: const Color(0xFFDAA520),
                            selectedBorderColor: const Color(0xFF969696),
                            selectedColor: Colors.black,
                            renderBorder: true,
                            isSelected: [_selectionsCinema[index]],
                            children: [
                              Container(
                                width: constraints.maxWidth - 30,
                                height: constraints.maxHeight,
                                color: _selectionsCinema[index]
                                    ? const Color(0xFFDAA520)
                                    : const Color(0xFF393E46),
                                child: Center(
                                  child: Column(
                                    // Mengganti dengan Row untuk menambahkan ikon dan teks secara horizontal
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.place,
                                          color: _selectionsCinema[index]
                                              ? Colors.black
                                              : Colors
                                                  .white), // Ganti dengan ikon yang sesuai

                                      const SizedBox(height: 7),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          _location[index],
                                          style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 10,
                                            color: _selectionsCinema[index]
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            onPressed: (pressIndex) {
                              setState(() {
                                if (_selectionsCinema[index] == true) {
                                  _selectionsCinema[index] = false;
                                } else {
                                  for (int i = 0;
                                      i < _selectionsCinema.length;
                                      i++) {
                                    _selectionsCinema[i] = false;
                                  }
                                  _selectionsCinema[index] = true;
                                }
                              });
                            },
                          ),
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
          ),

          // Konten Scroll 2
          const Padding(
            padding: EdgeInsets.only(
                top:
                    20.0), // Ubah nilai left sesuai dengan jumlah padding yang Anda inginkan
            child: Text(
              "Date",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFFFFDF00),
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: w,
            height: (h * 1.8 / 3.5) * 2.5 / 6.5,
            child: RawScrollbar(
              controller: _scrollContollerTwo,
              thumbVisibility: true,
              trackVisibility: false,
              thickness: 4,
              thumbColor: const Color(0xFFFFDF00),
              radius: const Radius.circular(20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollContollerTwo,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 1),
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        children: [
                          Positioned(
                            // Positioned sebagai latar belakang
                            top: 5.0,
                            left: 10.0,
                            child: Container(
                              width: constraints.maxWidth - 30,
                              height: constraints.maxHeight - 15,
                              color: const Color(
                                  0xFFFFDF00), // Warna latar belakang container
                            ),
                          ),
                          ToggleButtons(
                            constraints: BoxConstraints.expand(
                              width: constraints.maxWidth - 30,
                              height: constraints.maxHeight - 20,
                            ),
                            color: Colors.white,
                            borderColor: const Color(0xFF969696),
                            borderWidth: 1,
                            fillColor: const Color(0xFFDAA520),
                            selectedBorderColor: const Color(0xFF969696),
                            selectedColor: Colors.black,
                            renderBorder: true,
                            isSelected: [_selectionsDay[index]],
                            children: [
                              Container(
                                width: constraints.maxWidth - 30,
                                height: constraints.maxHeight - 20,
                                color: _selectionsDay[index]
                                    ? const Color(0xFFDAA520)
                                    : const Color(0xFF393E46),
                                child: Center(
                                  child: Column(
                                    // Mengganti dengan Row untuk menambahkan ikon dan teks secara horizontal
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _day[index],
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 12,
                                          color: _selectionsDay[index]
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        "0${index + 1}", // Menampilkan angka 1 sampai 7
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 12,
                                          color: _selectionsDay[index]
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            onPressed: (pressIndex) {
                              setState(() {
                                if (_selectionsDay[index] == true) {
                                  _selectionsDay[index] = false;
                                } else {
                                  for (int i = 0;
                                      i < _selectionsDay.length;
                                      i++) {
                                    _selectionsDay[i] = false;
                                  }
                                  _selectionsDay[index] = true;
                                }
                              });
                            },
                          ),
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
          ),

          // Konten Scroll 3
          const Padding(
            padding: EdgeInsets.only(
                top:
                    20.0), // Ubah nilai left sesuai dengan jumlah padding yang Anda inginkan
            child: Text(
              "Screen Time",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color(0xFFFFDF00),
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: w,
            height: (h * 1.56 / 3.5) * 3 / 6.5,
            child: RawScrollbar(
              controller: _scrollContollerThree,
              thumbVisibility: true,
              trackVisibility: false,
              thickness: 4,
              thumbColor: const Color(0xFFFFDF00),
              radius: const Radius.circular(20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollContollerThree,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 4,
                      crossAxisSpacing: 15.0),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        children: [
                          Positioned(
                            // Positioned sebagai latar belakang
                            top: 5.0,
                            left: 10.0,
                            child: Container(
                              width: constraints.maxWidth - 35,
                              height: constraints.maxHeight,
                              color: const Color(
                                  0xFFFFDF00), // Warna latar belakang container
                            ),
                          ),
                          ToggleButtons(
                            constraints: BoxConstraints.expand(
                              width: constraints.maxWidth - 30,
                              height: constraints.maxHeight - 5,
                            ),
                            color: Colors.white,
                            borderColor: const Color(0xFF969696),
                            borderWidth: 1,
                            fillColor: const Color(0xFFDAA520),
                            selectedBorderColor: const Color(0xFF969696),
                            selectedColor: Colors.black,
                            renderBorder: true,
                            isSelected: [_selectionsTime[index]],
                            children: [
                              Container(
                                width: constraints.maxWidth - 30,
                                height: constraints.maxHeight - 5,
                                color: _selectionsTime[index]
                                    ? const Color(0xFFDAA520)
                                    : const Color(0xFF393E46),
                                child: Center(
                                  child: Text(
                                    _time[index],
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 13,
                                      color: _selectionsTime[index]
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                            onPressed: (pressIndex) {
                              setState(() {
                                if (_selectionsTime[index] == true) {
                                  _selectionsTime[index] = false;
                                } else {
                                  for (int i = 0;
                                      i < _selectionsTime.length;
                                      i++) {
                                    _selectionsTime[i] = false;
                                  }
                                  _selectionsTime[index] = true;
                                }
                              });
                            },
                          ),
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xFFDAA520),
              backgroundColor: const Color(0xFFFFDF00),
              padding: const EdgeInsets.symmetric(horizontal: 133.0),
            ),
            onPressed: () {
              late String cinema;
              String? time;
              List<bool> check = [false, false, false];
              for (int i = 0; i < _selectionsCinema.length; i++) {
                if (_selectionsCinema[i] == true) {
                  cinema = _location[i];
                  check[0] = true;
                  break;
                }
              }
              for (int i = 0; i < _selectionsDay.length; i++) {
                if (_selectionsDay[i] == true) {
                  time = _day[i];
                  check[1] = true;
                  break;
                }
              }
              for (int i = 0; i < _selectionsTime.length; i++) {
                if (_selectionsTime[i] == true) {
                  if (time == null) {
                    time = _time[i];
                  } else {
                    time += ", ${_time[i]}";
                  }
                  check[2] = true;
                  break;
                }
              }
              if (!check.contains(false)) {
                ticket.cinema = cinema;
                ticket.time = time as String;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const Seat();
                  },
                ));
              } else {
                setState(() => checkSelected = true);
              }
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              setState(() {
                backPressed = !backPressed;
                Navigator.of(context).pop();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backPressed
                  ? const Color(0xFFDAA520)
                  : const Color(0xFF393E46),
              foregroundColor: const Color(0xFFDAA520),
              side: BorderSide(
                width: 1,
                color: backPressed
                    ? const Color(0xFFDAA520)
                    : const Color(0xFFFFDF00),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 149.0),
            ),
            child: Text(
              "Back",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: backPressed
                      ? const Color(0xFF000000)
                      : const Color(0xFFFFDF00),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Visibility(
              visible: checkSelected,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Pleaase Select First!',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    color: Color(0xffDAA520),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

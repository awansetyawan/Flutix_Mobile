part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> navMenu = [
      const TicketPage(),
      const Movies(),
      const ProfilePage()
    ];
    return Scaffold(
        appBar: _index == 2
            ? null
            : AppBar(
                toolbarHeight: 80,
                title: const HomeAppBarTitle(),
                backgroundColor: const Color(0xFFFFDF00),
                automaticallyImplyLeading: false,
              ),
        body: navMenu[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFFFDF00),
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.black87,
          currentIndex: _index,
          // onTap: ,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_sharp),
              label: "Ticket",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ));
  }
}

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Row(
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xFF393E46),
                border: Border.all(
                  color: const Color(0xFF000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                  image: 
                  // NetworkImage(userData.data!.profile!),
                   userData.data!.profile != ""
                  ? NetworkImage(userData.data!.profile!)
                  : const AssetImage('assets/Profile.png') as ImageProvider<Object>,
                ))),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  userData.data!.nama!,
                  style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontFamily: "Inter",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Rp. ${NumberFormat("#,##0", "id_ID").format(userData.data!.wallet)}",
                  style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontFamily: "Roboto",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

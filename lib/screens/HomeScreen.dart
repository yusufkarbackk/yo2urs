part of 'Screens.dart';

class HomeScreen extends StatefulWidget {
  final String id;
  const HomeScreen({Key? key, required this.id}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                //NOTE: HEADER
                Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 16),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                            color: kPrussanBlue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ))),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Hello, ',
                                  style:
                                      kMainText.copyWith(color: Colors.white)),
                              FutureBuilder<YoursUser>(
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data!.name,
                                          style: kMainText.copyWith(
                                              color: Colors.white));
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SpinKitFadingCircle(
                                        size: 50,
                                        color: kPrussanBlue,
                                      );
                                    } else {
                                      return Text('Error getting data');
                                    }
                                  },
                                  future: UserServices.getUser(user!.uid))
                            ],
                          ),
                          Container(
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TransactionCartScreen()));
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.shoppingCart,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                    //TODO: DYNAMIC SHOP ITEMS
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream:
                                          TransactionServices.getTransactions(
                                              user.uid),
                                      builder: (context, snapshots) {
                                        if (snapshots.hasData) {
                                          return Text(
                                              snapshots.data!.docs.length
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white));
                                        } else {
                                          return Container();
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: 28,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                ActivityWidget(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Beli oksigen dari rumah!',
                                  style: kMainText.copyWith(fontSize: 20)),
                              Text(
                                'Tidak ingin keluar rumah? Ingin menjaga keluarga agar tetap aman? Sekarang bisa beli oksigen dari rumah loh, cukup pesan dan akan diantar menuju rumah anda',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OxygenOrderScreen()));
                    }),
                ActivityWidget(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Beli obat dari rumah!',
                                  style: kMainText.copyWith(fontSize: 20)),
                              Text(
                                'Tidak ingin keluar rumah? Ingin menjaga keluarga agar tetap aman? Sekarang bisa beli obat  dari rumah loh, cukup pesan dan akan diantar menuju rumah anda',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicineOrderScreen()));
                    })
              ],
            ),
          )
        ],
      )),
    );
  }
}

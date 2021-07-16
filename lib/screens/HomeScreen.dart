part of 'Screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kLemonmeringue,
          body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Hello, ',
                              style: kMainText.copyWith(color: Colors.black)),
                          FutureBuilder<YoursUser>(
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!.name,
                                      style: kMainText.copyWith(
                                          color: Colors.black));
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
                      FaIcon(FontAwesomeIcons.user)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

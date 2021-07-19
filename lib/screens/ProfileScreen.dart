part of 'Screens.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: kPrussanBlue,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  FutureBuilder<YoursUser>(
                      future: UserServices.getUser(user?.uid ?? ''),
                      builder: (context, snapshots) {
                        if (snapshots.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: ${snapshots.data!.name}',
                                        style: kSeccondText.copyWith(
                                            color: Colors.white)),
                                    Text('Email: ${snapshots.data!.email}',
                                        style: kSeccondText.copyWith(
                                            color: Colors.white)),
                                    Text('Phone: ${snapshots.data!.phone}',
                                        style: kSeccondText.copyWith(
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    AuthServices.signOut(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: kDarkRed,
                                      fixedSize: Size(210, 40)),
                                  child: Center(
                                      child: Text('Sign Out',
                                          style: kSeccondText)))
                            ],
                          );
                        } else {
                          return Center(
                            child: SpinKitFadingCircle(
                              color: kPrussanBlue,
                              size: 50,
                            ),
                          );
                        }
                      }),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
            )));
  }
}

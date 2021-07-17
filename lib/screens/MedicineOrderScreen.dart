part of 'Screens.dart';

class MedicineOrderScreen extends StatelessWidget {
  const MedicineOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(bottom: 18),
          child: Column(
            children: [
              BlueHeaderWidget(text: 'Pesan Obat'),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = medicines[index];
                        final List<Widget> medicineItems = [];
                        for (var item in medicine.medicines) {
                          medicineItems.add(Text(item,
                              style: kSeccondText.copyWith(fontSize: 12)));
                        }

                        return MedicineDetailWidget(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(medicine.packageName,
                                style: kMainText.copyWith(fontSize: 18)),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: medicineItems,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${medicine.price}',
                                      style: kSeccondText.copyWith(
                                          fontSize: 14, color: Colors.green)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CheckoutScreen(
                                                      isOxygen: false,
                                                      medicine: medicine,
                                                    )));
                                      },
                                      child: Center(
                                        child: Text('Beli'),
                                      ))
                                ])
                          ],
                        ));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

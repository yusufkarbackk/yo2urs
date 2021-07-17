part of 'Models.dart';

class Medicine {
  final String packageName;
  final List<String> medicines;
  final int price;

  Medicine(
      {required this.packageName,
      required this.medicines,
      required this.price});
}

List<Medicine> medicines = [
  Medicine(
      packageName: "paket lengkap 1",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin'
      ],
      price: 50000),
  Medicine(
      packageName: "paket lengkap 2",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine'
      ],
      price: 65000),
  Medicine(
      packageName: "paket lengkap 3",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost'
      ],
      price: 80000),
  Medicine(
      packageName: "paket lengkap 4",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost',
        '1 botol CDR'
      ],
      price: 100000),
  Medicine(
      packageName: "paket lengkap 5",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost',
        '1 botol CDR',
        '2x susu Bear brand'
      ],
      price: 130000),
  Medicine(
      packageName: "paket lengkap 6",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost',
        '1 botol CDR',
        '2x susu Bear brand',
        '1 botol vitamin C'
      ],
      price: 160000),
  Medicine(
      packageName: "paket lengkap 6",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost',
        '1 botol CDR',
        '2x susu Bear brand',
        '1 botol vitamin C',
        '2x botol madu'
      ],
      price: 160000),
  Medicine(
      packageName: "paket lengkap 7",
      medicines: [
        '1x Panadol merah',
        '1x Panadol biru',
        '1x Panadol hijau',
        '1 kotak Tolak angin',
        '1x Betadine',
        '1 botol ImBoost',
        '1 botol CDR',
        '2x susu Bear brand',
        '1 botol vitamin C',
        '2x botol madu',
        '2 box masker'
      ],
      price: 200000)
];

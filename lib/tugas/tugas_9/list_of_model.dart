import 'package:flutter/material.dart';
import 'package:flutter_masibelajar/tugas/tugas_9/model/produk_model.dart';

class ListOfModelTugas9 extends StatelessWidget {
  ListOfModelTugas9({super.key});

  List<ProdukModel> dataProduk = [
    ProdukModel(
      nama: "Puma Cali Dream Mix / Cali Star White Multi-Color",
      gambar: "assets/images/shoes/puma-cali-dream.avif",
      harga: 1400000,
      ukuran: [35.5, 36, 37, 37.5, 38, 38.5, 39, 40, 40.5, 41, 42],
      deskripsi:
          "Sneakers kasual dengan siluet chunky khas Puma Cali, tampilan multi-warna yang playful, cocok untuk gaya sehari-hari.",
    ),
    ProdukModel(
      nama: "Adidas Yeezy Slide Bone / Pure",
      gambar: "assets/images/shoes/adidas-yeezy-slide.avif",
      harga: 2100000,
      ukuran: [37, 38, 39, 40.5, 42, 43, 44.5, 46, 47, 48],
      deskripsi:
          "Sandal slide EVA foam dengan desain minimalis dan warna netral, ringan, empuk, dan nyaman dipakai dalam waktu lama.",
    ),
    ProdukModel(
      nama: "Stüssy x Nike Benassi Slide Pine Green / Cactus",
      gambar: "assets/images/shoes/stüssy-x-nike-benassi-slide.avif",
      harga: 950000,
      ukuran: [36, 37.5, 38.5, 40, 41, 42.5, 44, 45, 46, 47.5],
      deskripsi:
          "Hasil kolaborasi Stüssy x Nike, sandal slide dengan warna hijau khas outdoor dan sol empuk untuk santai maupun jalan-jalan ringan.",
    ),
    ProdukModel(
      nama: "Supreme x Nike Air Force 1 Low White",
      gambar: "assets/images/shoes/supreme-x-nike-air-force-1-low.avif",
      harga: 2600000,
      ukuran: [36, 37.5, 38.5, 40, 41, 42.5, 44, 45, 46, 47.5, 48.5],
      deskripsi:
          "Edisi kolaborasi limited dari ikon Air Force 1, warna putih bersih dengan detail branding Supreme, item incaran para kolektor sneaker.",
    ),
    ProdukModel(
      nama: "Travis Scott x Air Jordan 1 Low OG Black Phantom",
      gambar:
          "assets/images/shoes/travis-scott-x-air-jordan-1-retro-low-OG.avif",
      harga: 9500000,
      ukuran: [35.5, 36, 37.5, 38.5, 40, 41, 42.5, 44, 45, 46, 47.5, 48, 49],
      deskripsi:
          "Kolaborasi eksklusif Travis Scott dengan Air Jordan 1 Low, desain distressed khas dan warna gelap, salah satu sneaker paling hype dan bernilai tinggi.",
    ),
    ProdukModel(
      nama: "Adidas Ultraboost 20 Solar Red / Blue Violet",
      gambar: "assets/images/shoes/adidas-ultraboost-20.avif",
      harga: 3000000,
      ukuran: [40, 40.5, 41.5, 42, 42.5, 43.5, 44, 44.5, 45.5, 46, 47.5, 48],
      deskripsi:
          "Sepatu lari performa tinggi dengan teknologi Boost midsole untuk bantalan responsif dan energy return maksimal.",
    ),
    ProdukModel(
      nama: "Nike Air Force 1 Shadow Pale Ivory / Pastel Multi",
      gambar: "assets/images/shoes/nike-air-force-1-shadow.avif",
      harga: 2000000,
      ukuran: [36, 38, 39, 40, 41, 42, 43, 44],
      deskripsi:
          "Versi feminin dari Air Force 1 dengan lapisan sol berlapis dan warna pastel lembut, tampil stylish tanpa berlebihan.",
    ),
    ProdukModel(
      nama: "Nike Joyride Dual Run Black / Volt",
      gambar: "assets/images/shoes/nike-joyride-dual-run.avif",
      harga: 2100000,
      ukuran: [38.5, 39, 40, 40.5, 41, 42, 42.5, 43, 44, 44.5, 45, 46, 47.5],
      deskripsi:
          "Sepatu lari dengan teknologi Joyride Foam berisi butiran mikro untuk kenyamanan adaptif di setiap langkah.",
    ),
    ProdukModel(
      nama: "Puma Rise Wn's Black / White Translucent",
      gambar: "assets/images/shoes/puma_rise.avif",
      harga: 1600000,
      ukuran: [36, 37, 37.5, 38, 38.5, 39, 40, 40.5, 41, 42],
      deskripsi:
          "Sneakers chunky bergaya futuristik dengan aksen translucent, cocok untuk tampilan streetwear yang bold.",
    ),
    ProdukModel(
      nama: "Air Jordan 4 Retro Military Black",
      gambar: "assets/images/shoes/air-jordan-4-retro.avif",
      harga: 7200000,
      ukuran: [35.5, 36, 37.5, 38.5, 40, 41, 42.5, 44, 45, 46, 47.5],
      deskripsi:
          "Retro klasik dari lineup Jordan 4 dengan desain mesh dan detail military, ikonik dan selalu jadi favorit kolektor.",
    ),
    ProdukModel(
      nama: "New Balance 550 White Light Pink Navy Gum / Workwear Red",
      gambar: "assets/images/shoes/nb-550.avif",
      harga: 1900000,
      ukuran: [36, 37, 38, 40, 42, 43, 44, 45],
      deskripsi:
          "Sneakers basket retro dengan siluet chunky khas 550, kombinasi warna vintage yang serba guna untuk daily outfit.",
    ),
    ProdukModel(
      nama: "New Balance CT302 Burgundy / Cream",
      gambar: "assets/images/shoes/nb-ct302.avif",
      harga: 1600000,
      ukuran: [36, 37, 37.5, 38, 38.5, 39.5, 40, 40.5, 41.5, 42, 42.5, 43, 44],
      deskripsi:
          "Sneakers court style dengan tampilan clean dan warna burgundy elegan, cocok dipadukan dengan berbagai outfit kasual.",
    ),
    ProdukModel(
      nama: "New Balance 997H Cordura Multi-Color",
      gambar: "assets/images/shoes/nb-997h.avif",
      harga: 1500000,
      ukuran: [40, 40.5, 41.5, 42, 42.5, 43, 44, 44.5, 45, 46.5],
      deskripsi:
          "Menggunakan material Cordura yang tahan lama, sneakers ini menghadirkan gaya retro-running dengan sentuhan warna multi-tone.",
    ),
    ProdukModel(
      nama: "Puma Smash v2 Leather All White",
      gambar: "assets/images/shoes/puma-smash-v2.avif",
      harga: 850000,
      ukuran: [36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46],
      deskripsi:
          "Sneakers kulit klasik serba putih, desain simpel dan mudah dipadukan, pilihan tepat untuk gaya minimalis sehari-hari.",
    ),
    ProdukModel(
      nama: "Adidas Forum Bonega Cloud White / Core Black / Gold Metallic",
      gambar: "assets/images/shoes/adidas-forum-bonega.avif",
      harga: 1800000,
      ukuran: [36, 36.5, 37.5, 38, 38.5, 39.5, 40, 40.7, 41.5, 42],
      deskripsi:
          "Versi modern dari Forum klasik dengan strap ikonik dan aksen gold metallic, tampil fresh dan feminin.",
    ),
    ProdukModel(
      nama: "ASICS GEL-Kayano 14 White / Pure Silver / Black",
      gambar: "assets/images/shoes/asics-gel-kayano.avif",
      harga: 2800000,
      ukuran: [36, 37, 38, 39, 42, 44, 45, 46],
      deskripsi:
          "Sepatu lari legendaris dengan teknologi GEL cushioning, dikenal karena kenyamanan dan stabilitasnya untuk lari jarak jauh.",
    ),
    ProdukModel(
      nama: "Nike Air Zoom SuperRep 2 Volt / Black",
      gambar: "assets/images/shoes/nike-airzoom-superrep-2.avif",
      harga: 1850000,
      ukuran: [38.5, 39, 40, 40.5, 41, 42, 42.5, 43, 44, 44.5, 45, 46],
      deskripsi:
          "Dirancang untuk latihan HIIT dan olahraga intensitas tinggi, dengan traksi kuat dan bantalan responsif.",
    ),
    ProdukModel(
      nama: "Nike Legend Essential 2 Black / White / Gum",
      gambar: "assets/images/shoes/nike-legend-essentials-2.avif",
      harga: 950000,
      ukuran: [38.5, 39, 40, 40.5, 41, 42, 42.5, 43, 44, 44.5, 45, 46],
      deskripsi:
          "Sepatu training serbaguna dengan desain simpel dan tahan lama, cocok untuk latihan gym maupun aktivitas harian.",
    ),
    ProdukModel(
      nama: "Nike Kyrie 7 Black White",
      gambar: "assets/images/shoes/nike-kyrie-7.avif",
      harga: 2400000,
      ukuran: [40, 40.5, 41, 42, 42.5, 43, 44, 44.5, 45, 46, 47.5],
      deskripsi:
          "Sepatu basket signature Kyrie Irving dengan traksi agresif dan cushioning responsif untuk gerakan cepat di lapangan.",
    ),
    ProdukModel(
      nama: "Nike Offcourt Slide University Red / Black White",
      gambar: "assets/images/shoes/nike_offcourt_side.jpg",
      harga: 550000,
      ukuran: [38.5, 39, 40, 40.5, 41, 42, 42.5, 43, 44, 44.5, 45, 46, 47.5],
      deskripsi:
          "Sandal slide ringan dengan strap empuk dan sol anti-slip, pilihan praktis untuk pemakaian sehari-hari atau di area basah.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        padding: EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 96),
        itemCount: dataProduk.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Katalog Produk",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kategori: Sepatu dan Sandal",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            );
          }
          return Container(
            width: 400,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Container(
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(dataProduk[index].gambar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            dataProduk[index].nama,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                          Text(
                            dataProduk[index].deskripsi,
                            style: TextStyle(fontSize: 12),
                            softWrap: true,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsetsGeometry.zero,
                          ),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          "Lihat selengkapnya",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff4d81e7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

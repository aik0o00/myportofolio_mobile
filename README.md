# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Tugas 7
1. Widget tree adalah struktur hierarki yang menunjukkan susunan widget dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai anaknya (child), sehingga membentuk hubungan parent-child. Hubungan parent-child memungkinkan widget induk mengatur tata letak dan perilaku widget anaknya. Contohnya, Column menyusun widget anak secara vertikal, sedangkan Row menyusun widget anak secara horizontal.

2. Widget yang digunakan dalam proyek MyPortfolio Mobile antara lain:
• MaterialApp: Menjadi root widget
• Scaffold: Menyediakan struktur dasar halaman aplikasi
• SingleChildScrollView: Memungkinkan halaman bisa discroll ketika kontennya melebihi ukuran layar
• Padding: Memberikan jarak di sekitar widget
• Column: Menyusun anak widget secara vertikal
• Row: Menyusun anak widget secara horizontal
• Text: Menampilkan teks, seperti judul, informasi pengguna
• Card: Menampilkan informasi pengguna dalam bentuk kartu
• Container: Mengatur ukuran, padding, dan tata letak konten
• SizedBox: Memberikan jarak antar-widget
• GridView.count: Menampilkan tombol aksi dalam bentuk grid dengan jumlah kolom yang ditentukan
• Material: Memberikan warna latar belakang dan bentuk sudut pada kartu tombol
• InkWell: Membuat kartu dapat menerima interaksi ketika ditekan
• Icon: Menampilkan ikon yang mewakili setiap tombol aksi
• SnackBar: Menampilkan pesan sementara setelah tombol ditekan
• InfoCard: Menampilkan informasi NPM, nama, dan kelas pengguna
• ItemCard: Menampilkan tombol aksi yang terdiri dari ikon, teks, dan warna latar

3. MaterialApp merupakan widget yang menyediakan konfigurasi dasar untuk aplikasi Flutter yang menggunakan Material Design. Widget ini mengatur berbagai hal, seperti tema aplikasi, navigasi, dan halaman utama.

4. StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah selama widget digunakan. Tampilan widget bergantung pada data atau parameter yang diterima. StatefulWidget adalah widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Perubahan state dapat menyebabkan tampilan widget dibangun ulang, biasanya menggunakan setState().

Dalam proyek MyPortfolio Mobile, MyHomePage, InfoCard, dan ItemCard menggunakan StatelessWidget karena tampilannya tidak membutuhkan perubahan state internal secara langsung. StatelessWidget cocok digunakan untuk tampilan yang relatif tetap, sedangkan StatefulWidget lebih sesuai untuk fitur yang membutuhkan perubahan data atau tampilan

5. BuildContext merupakan objek yang merepresentasikan posisi sebuah widget di dalam widget tree. Dengan BuildContext, sebuah widget dapat mengakses informasi dan layanan dari widget-widget di atasnya dalam hierarki.

6. Hot reload adalah fitur Flutter yang memungkinkan perubahan kode diterapkan ke aplikasi yang sedang berjalan tanpa memulai ulang aplikasi dari awal. Fitur ini membantu proses pengembangan menjadi lebih cepat karena state aplikasi umumnya tetap dipertahankan.

Hot restart berbeda dari hot reload karena aplikasi dimulai ulang dan state aplikasi diinisialisasi kembali. Namun, hot restart tidak sama dengan menghentikan dan menjalankan ulang proses aplikasi secara penuh. Hot reload cocok digunakan ketika mengubah tampilan, teks, warna, atau tata letak widget. Sementara itu, hot restart diperlukan ketika perubahan kode tidak dapat diterapkan dengan hot reload, misalnya ketika terdapat perubahan pada inisialisasi state atau variabel global yang perlu dijalankan ulang.


### Tugas 8
1. Navigator.push() digunakan untuk membuka halaman baru dan menambahkan halaman tersebut ke navigation stack, sehingga pengguna dapat kembali ke halaman sebelumnya. Navigator.pushReplacement() digunakan untuk membuka halaman baru sekaligus menggantikan halaman sebelumnya, sehingga halaman sebelumnya tidak lagi menjadi bagian dari stack. Sementara itu, Navigator.pop() digunakan untuk menutup halaman yang sedang dibuka dan kembali ke halaman sebelumnya. Pada aplikasi ini, Navigator.push() digunakan untuk membuka formulir Skills dan Experience dari kartu aksi Home. Opsi Home pada Drawer menggunakan Navigator.pushReplacement() untuk membawa pengguna kembali ke halaman utama.

2. Scaffold digunakan sebagai kerangka utama halaman yang mengatur bagian seperti AppBar, Drawer, dan body. AppBar berfungsi menampilkan judul halaman, sedangkan Drawer digunakan untuk memudahkan pengguna berpindah halaman. Penggunaan struktur dan warna yang sama, seperti warna biru gelap pada AppBar dan tombol, membuat tampilan setiap halaman tetap konsisten dan memiliki identitas yang sama.

3. Tata letak formulir dibuat agar pengguna lebih mudah mengisi setiap input. Padding digunakan untuk memberikan jarak antarwidget agar tampilannya tidak terlalu rapat, sedangkan SizedBox digunakan untuk memberikan jarak tambahan. SingleChildScrollView digunakan agar halaman bisa digulir ketika isi formulir terlalu panjang atau layar terlalu kecil, sehingga semua input dan tombol Save tetap bisa diakses.

4. GlobalKey<FormState> digunakan untuk mengakses Form dan menjalankan validasi. Validator berfungsi memeriksa apakah input yang dimasukkan sudah sesuai, sedangkan validate() digunakan untuk menjalankan semua validasi ketika tombol Save ditekan. Contohnya, input yang hanya berisi spasi akan ditolak karena dianggap kosong setelah menggunakan trim(). Pemilihan jenis input saja belum cukup untuk memastikan data yang dimasukkan benar, karena pengguna masih bisa mengisi data kosong atau tidak sesuai. Oleh karena itu, validasi diperlukan agar data yang dimasukkan memenuhi ketentuan.
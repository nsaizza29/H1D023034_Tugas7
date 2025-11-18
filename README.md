# Tugas 6 Praktikum Mobile Pertemuan 8
- Nama   : Nisa Izzatul Ummah
- NIM    : H1D023034
- Shift  : D

# Hasil Screenshot
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max)" src="https://github.com/user-attachments/assets/135c64d0-4a72-4346-9866-200fce48b94a" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (1)" src="https://github.com/user-attachments/assets/fa54e2e8-d385-4602-8730-6046e96ea3ff" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (2)" src="https://github.com/user-attachments/assets/4344dabb-f25b-42fe-ac67-9e5b83312d68" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (3)" src="https://github.com/user-attachments/assets/b20bca68-f088-4ba5-b139-4d948670a121" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (4)" src="https://github.com/user-attachments/assets/f56eb4af-929e-4f42-a043-d62186bcb274" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (5)" src="https://github.com/user-attachments/assets/db330f57-2c16-44aa-8a4d-868de35902ca" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (6)" src="https://github.com/user-attachments/assets/228e28f0-e7ba-4937-ad75-2c7919c7880f" />
<img width="300" height="600" alt="localhost_51958_(iPhone 14 Pro Max) (7)" src="https://github.com/user-attachments/assets/c0b88aa4-db31-4daf-ac26-77e22ffb9e07" />


# Penjelasn Source Code
## Alur Umum
Aplikasi ini memiliki dua halaman utama:
- FormData: Halaman untuk menginput data mahasiswa.
- TampilData: Halaman untuk menampilkan data yang telah diinput.

## 1. Input Data pada Form
Pada halaman FormData, pengguna mengisi:
- Nama Lengkap → disimpan pada _namaController.text
- NIM → disimpan pada _nimController.text
- Tahun Lahir → disimpan pada _selectedTahun
Semua input dikontrol menggunakan TextEditingController dan komponen DropdownButtonFormField untuk tahun lahir.

## 2. Mengirim Data ke Halaman Tampil
Ketika tombol “TAMPILKAN DATA” ditekan, proses validasi dijalankan.
Jika data valid, maka dilakukan navigasi ke halaman TampilData menggunakan Navigator.push() berikut:

<pre> Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => TampilData(
      nama: _namaController.text,
      nim: _nimController.text,
      tahunLahir: _selectedTahun!,
    ),
  ),
); </pre>

Pada baris ini, data dikirim dari form menuju halaman tampilan melalui parameter konstruktor (nama, nim, tahunLahir).

## 3. Menerima dan Menampilkan Data
Halaman TampilData menerima data tersebut melalui konstruktor:

<pre> class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;

  const TampilData({
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  });
} </pre>

Data kemudian digunakan untuk ditampilkan kembali ke pengguna dan menghitung umur menggunakan:

<pre> int get umur => DateTime.now().year - tahunLahir; </pre>

## 4. Kembali ke Halaman Form
Saat tombol “KEMBALI KE FORM” ditekan, halaman TampilData ditutup menggunakan:

<pre> Navigator.of(context).pop(); </pre>

Sehingga pengguna kembali ke halaman input form tanpa kehilangan data sebelumnya.

## Kesimpulan
Proses passing data dilakukan menggunakan:
- Navigator.push() untuk berpindah halaman sekaligus mengirim data.
- Konstruktor class untuk menerima data di halaman tujuan.

typedef UpdateNameCallback =
  Function({String updateName, int age, String address,});
void main() {

  dynamic refresh = (){
    print('refresh UI berhasil');
  };

  greet(
    name: 'kipip',
    callback: (UpdateNameCallback, age, address) async {
      print('Update Name: $updateName');
      print('age: $age');
      print('Address: $address');
      await refresh();
    },
  );

  fetchDataFromServer();
}

String fulName({
  required String belakang,
  required String depan,
  String? tengah,
}) {
  return "Nama Lengkap: $depan $tengah $belakang";
}

void validasi(String email) => print("validasi Berhasil $email");

Future<void> greet({required String name, required UpdateNameCallback callback}) async {
  await Future.delayed(Duration(seconds: 2));
  print('hello, $name!');
  callback(
    updateName: 'Kipip Kupup',
    age: 20,
    address: 'Jl. Merdeka No. 10',
  );
}

Future<String> fetchDataFromServer() async {
  await Future.delayed(Duration(seconds: 3));
  return "Data from server";
}
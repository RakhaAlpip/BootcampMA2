class Bangunan<T> {
 final T material;

  Bangunan({required this.material});
}

class lokasi{}

class profile{}

void main() {
  Bangunan<String> rumah = Bangunan<String>(material: "Batu Bata");
  Bangunan<int> jembatan = Bangunan<int>(material: 100); // misal 100 ton baja

  print('Material rumah: ${rumah.material}');
  print('Material jembatan: ${jembatan.material} ton baja');

  // call api lokasi
  APIResponse<lokasi> responseLokasi = APIResponse<lokasi>(
    statusCode: 200,
    data: lokasi(),
  );

  // call api profile
  APIResponse<profile> responseProfile = APIResponse<profile>(
    statusCode: 200,
    data: profile(),
  );
}

class APIResponse<T> {
  final int statusCode;
  final T data;

  APIResponse({required this.statusCode, required this.data});
}
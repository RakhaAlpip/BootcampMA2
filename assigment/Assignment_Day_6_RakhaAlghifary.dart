class User {
  String _email;
  String _password;

  User(this._email, this._password);

  String get email => _email;
  String get password => _password;

  bool login(String email, String password) {
    return _email == email && _password == password;
  }
}

class Customer extends User {
  String _name;
  String _address;

  Customer(String name, String email, String password, String address)
      : _name = name,
        _address = address,
        super(email, password);

  String get name => _name;
  String get address => _address;

  @override
  String toString() =>
      'Customer: $name, Email: $email, Address: $address';
}

class Admin extends User {
  List<String> _permissions;

  Admin(String email, String password, List<String> permissions)
      : _permissions = permissions,
        super(email, password);

  List<String> get permissions => _permissions;

  @override
  String toString() =>
      'Admin: $email, Permissions: ${permissions.join(", ")}';
}


void displayUsers(List<User> users) {
  for (var user in users) {
    print(user.toString());
  }
}


List<Customer> customers = [
  Customer("John Doe", "john.doe@example.com", "password123", "Jakarta"),
  Customer("Jane Smith", "jane.smith@example.com", "secure456", "Bandung"),
  Customer("Andi Pratama", "andi.pratama@example.com", "flutter789", "Surabaya"),
  Customer("Siti Rahma", "siti.rahma@example.com", "coding001", "Yogyakarta"),
  Customer("Budi Santoso", "budi.santoso@example.com", "paspas", "Semarang"),
];


List<Admin> admins = [
  Admin("admin1@example.com", "adminpass1", ["add", "edit", "delete"]),
  Admin("admin2@example.com", "adminpass2", ["add", "view"]),
  Admin("admin3@example.com", "adminpass3", ["edit", "delete"]),
  Admin("admin4@example.com", "adminpass4", ["view"]),
  Admin("admin5@example.com", "adminpass5", ["add", "edit"]),
];

void main() {
  print("=== Semua Customers ===");
  displayUsers(customers);

  print("\n=== Semua Admins ===");
  displayUsers(admins);


  var foundCustomer = customers.firstWhere(
      (c) => c.login("andi.pratama@example.com", "flutter789"),
      orElse: () => Customer("", "", "", ""));
  print(foundCustomer.name.isNotEmpty
      ? "\nLogin customer berhasil: ${foundCustomer.name}"
      : "\nLogin customer gagal");

  var foundAdmin = admins.firstWhere(
      (a) => a.login("admin2@example.com", "adminpass2"),
      orElse: () => Admin("", "", []));
  print(foundAdmin.email.isNotEmpty
      ? "\nLogin admin berhasil: ${foundAdmin.email} dengan izin: ${foundAdmin.permissions.join(', ')}"
      : "\nLogin admin gagal");
}
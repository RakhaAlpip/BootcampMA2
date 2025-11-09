extension StringEGG on String {
  String addAnInStart() => 'a.n $this';
  String addAnInEnd() => '$this a.n';

  Future<String> toJson() async {
    return '{"value": "$this"}';
  }
}

extension IntEGG on int {
  String addAnInStart() => 'a.n $this';

  Map<String, dynamic> toJson() {
    return {'value': this};
  }
}
class FakeRepo {
  Future<List<Data>> getUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Data(id: 1, name: 'John Doe'),
      Data(id: 2, name: 'Jane Doe'),
      Data(id: 8, name: 'Jane Ali'),
      Data(id: 7, name: 'Jane Hassan'),
      Data(id: 5, name: 'Jane Ok'),
    ];
  }

  Future<List<Data>> getFavoriteUsers() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Data(id: 1, name: 'John Doe'),
      Data(id: 2, name: 'Jane Doe'),
    ];
  }
}

class Data {
  final int id;
  final String name;

  Data({required this.id, required this.name});
}

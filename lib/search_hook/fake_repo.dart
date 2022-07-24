class FakeRepo {
  static final listOFDesctiption = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ' Donec euismod, nisl eget consectetur tempor, nisl nunc',
    ' consectetur nunc, euismod euismod nisl nunc euismod nunc.',
    ' Donec euismod, nisl eget consectetur tempor, nisl nunc consectetur nunc, ',
    'euismod euismod nisl nunc euismod nunc. Donec euismod, nisl eget consectetur tempor,',
    ' nisl nunc consectetur nunc, euismod euismod nisl nunc euismod nunc. Donec euismod, ',
    'nisl eget consectetur tempor, nisl nunc consectetur nunc, euismod euismod nisl nunc ',
    'euismod nunc. Donec euismod, nisl eget consectetur tempor, nisl nunc consectetur nunc,',
    ' euismod euismod nisl nunc euismod nunc. Donec euismod, nisl eget ',
    'consectetur tempor, nisl nunc consectetur nunc, euismod euismod nisl nunc euismod nunc. Donec euismod, nisl eget consectetur tempor, nisl nunc consectetur',
    ' nunc, euismod euismod nisl nunc euismod nunc. Donec euismod, nisl eget consectetur tempor, nisl nunc consectetur nunc, euismod euismod nisl nunc euismod nunc.',
    'nunc consectetur nunc, euismod euismod nisl nunc euismod nunc. Donec euism',
    ' just fake data',
    "ok what is this",
    "fakkkkkkkkkke data",
    "fine fine it is",
  ];

  List<String> getData() => listOFDesctiption;
  List<String> search(String txt) => listOFDesctiption
      .where((element) => element.toLowerCase().split(" ").contains(txt.toLowerCase()))
      .toList();
}

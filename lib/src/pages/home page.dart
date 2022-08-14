import 'package:flutter/material.dart';
import 'package:fruit/src/models/fruit_data_model.dart';
import 'package:fruit/src/pages/fruit_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  static List<String> fruitname = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'PineApple'
  ];
  static List url = [
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
    'https://media.istockphoto.com/photos/mango-isolated-on-white-background-picture-id911274308?k=20&m=911274308&s=612x612&w=0&h=YY8-xqycxsqFea5B-JdhlcgExlXYWMiFoLJdQ-LUx5E=',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'
  ];

  static List description = [
    'Apple is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Banana is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Mango is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Orange is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Pineapple is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
  ];

  final List<FruitDataModel> Fruitdata = List.generate(
      fruitname.length,
      (index) => FruitDataModel(
          '${fruitname[index]}', '${url[index]}', '${description[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: Fruitdata.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              child: Card(
                child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      Fruitdata[index].name,
                      style: TextStyle(fontSize: 25),
                    ),
                    leading: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.network(Fruitdata[index].ImageUrl),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                FruitDetail(fruitDataModel: Fruitdata[index])),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Kittisak Sutthikittipong '),
            accountEmail: const Text('Kittisak.sutthikittipong@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/image/0001.jpg')),
          ),
          ListTile(
              title: const Text('Apple'),
              leading: const Icon(Icons.adb_outlined),
            onTap: () {
              Navigator.of(context).pop(
              );
            }
              ),
          ListTile(
              title: const Text('Banana'),
              leading: const Icon(Icons.adb_outlined),
              onTap: () {
                Navigator.of(context).pop();
              }
              ),
          ListTile(
              title: const Text('Mango'),
              leading: const Icon(Icons.adb_outlined),
              onTap: () {
                Navigator.of(context).pop();
              }
              ),
          ListTile(
              title: const Text('Orange'),
              leading: const Icon(Icons.adb_outlined),
              onTap: () {
                Navigator.of(context).pop();
              }
              ),
          ListTile(
              title: const Text('Pineapple'),
              leading: const Icon(Icons.adb_outlined),
              onTap: () {
                Navigator.of(context).pop();
              }
              ),
        ],
      )
      ),
    );
  }
}

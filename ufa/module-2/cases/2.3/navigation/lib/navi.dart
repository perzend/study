import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int _selectedIndex = 0;
List<Widget> _widgetOptions = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.home,
        size: 200.0,
      ),
      Text(
        'Главная',
        style: TextStyle(fontSize: 32.0),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.list,
        size: 200.0,
      ),
      Text(
        'Каталог',
        style: TextStyle(fontSize: 32.0),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.shopping_basket,
        size: 200.0,
      ),
      Text(
        'Корзина',
        style: TextStyle(fontSize: 32.0),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.help,
        size: 200.0,
      ),
      Text(
        'Помощь',
        style: TextStyle(fontSize: 32.0),
      ),
    ],
  ),
];

List<MaterialColor> _colors = const [
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.green
];

List<String> _menuItems = ['Главная', 'Каталог', 'Корзина', 'Помощь'];

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

AppBar _appBar(context) {
  final ButtonStyle _buttonStyle =
      TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
  return AppBar(
    backgroundColor: _colors.elementAt(_selectedIndex),
    title: Text(_menuItems.elementAt(_selectedIndex)),
    actions: [
      TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Статус заказа'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'))
                    ],
                  ));
        },
        child: const Text(
          'Статус заказа',
        ),
        style: _buttonStyle,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.login),
      ),
    ],
  );
}

Widget navDrawer(context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: _colors.elementAt(_selectedIndex)),
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/320px-Google-flutter-logo.svg.png',
                    ),
                  ),
                  const Text('Навигация во Flutter'),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Главная'),
            onTap: () {
              _selectedIndex = 0;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Каталог'),
            onTap: () {
              _selectedIndex = 1;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatalogScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Корзина'),
            onTap: () {
              _selectedIndex = 2;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasketScreen(),
                  ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Помощь'),
            onTap: () {
              _selectedIndex = 3;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpScreen(),
                  ));
            },
          ),
        ],
      ),
    );



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navDrawer(context),
      appBar: _appBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navDrawer(context),
      appBar: _appBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navDrawer(context),
      appBar: _appBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navDrawer(context),
      appBar: _appBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: _menuItems.elementAt(_selectedIndex),
              backgroundColor: _colors.elementAt(_selectedIndex)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

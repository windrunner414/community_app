import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:community/common/font/IconFont.dart';
import 'package:community/common/redux/AppState.dart';
import 'package:community/common/style/theme/AppTheme.dart';
import 'package:community/page/HomePage.dart';
import 'package:community/page/UserCenterDrawerPage.dart';
import 'package:community/common/widget/BottomNavBar.dart';
import 'package:community/Global.dart';
import 'package:community/common/redux/StorePersist.dart';

void main() {
  run();
}

void run() async {
  try {
    var persistData = await getStorePersistData();
    AppState initialState = persistData == null ? AppState.initialState : AppState.fromJson(persistData);

    Store<AppState> store = Store<AppState>(
      appReducer,
      initialState: initialState,
      middleware: [thunkMiddleware],
    );
    persistStore(store);

    runApp(App(store));
  } catch (e) {
    //TODO: push error log and exit app
    Fluttertoast.instance.showToast(msg: '软件不小心崩溃了~');
    rethrow;
  }
}

class App extends StatelessWidget {
  final Store<AppState> store;

  App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, ThemeData>(
        converter: (store) => AppTheme.getThemeData(store.state.theme),
        builder: (context, ThemeData theme) {
          return MaterialApp(
            title: '社区',
            theme: theme,
            home: MainPage(),
          );
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0;
  List<List> _bottomNavItems = [
    [
      BottomNavBarItem(text: Text('社区'), icon: Icon(IconFont.home)),
      HomePage(),
    ],
    [
      BottomNavBarItem(text: Text('教程'), icon: Icon(IconFont.block)),
      HomePage(),
    ],
    [
      BottomNavBarItem(text: null, icon: null),
      null,
    ],
    [
      BottomNavBarItem(text: Text('开源'), icon: Icon(IconFont.block)),
      HomePage(),
    ],
    [
      BottomNavBarItem(text: Text('文档'), icon: Icon(IconFont.block)),
      HomePage(),
    ],
  ];

  int _lastBeforeQuitTime = 0;

  Future<bool> _beforeQuit() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastBeforeQuitTime > 1500) {
      _lastBeforeQuitTime = now;
      Fluttertoast.instance.showToast(msg: '再按一次退出程序');
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavBarItem> navButtons = [];
    _bottomNavItems.forEach((nav) {
      navButtons.add(nav[0]);
    });

    return Scaffold(
      key: mainScaffoldKey,
      body: WillPopScope(
        onWillPop: () {
          if (mainScaffoldKey.currentState.isDrawerOpen) {
            return Future.value(true);
          } else {
            return _beforeQuit();
          }
        },
        child: _bottomNavItems[_bottomNavIndex][1],
      ),
      drawer: UserCenterDrawerPage(),
      floatingActionButton: SizedBox(
        width: 48,
        height: 48,
        child: Opacity(
          opacity: 0.85,
          child: FloatingActionButton(
            onPressed: () {

            },
            child: Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        currentIndex: _bottomNavIndex,
        onTap: (int index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: navButtons,
      ),
    );
  }
}
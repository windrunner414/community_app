import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:community/page/HomePageAll.dart';
import 'package:community/common/redux/AppState.dart';
import 'package:community/common/utils/ImageUtils.dart';
import 'package:community/common/widget/AppBarLeadingAvatar.dart';
import 'package:community/Global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _tabController;
  List<List<Widget>> _tabs = [
    [
      Container(
        child: Center(
          child: Text('全部'),
        ),
      ),
      HomePageAll()
    ],
    [
      Container(
        child: Center(
          child: Text('问答'),
        ),
      ),
      HomePageAll()
    ],
    [
      Container(
        child: Center(
          child: Text('文章'),
        ),
      ),
      HomePageAll()
    ],
  ];

  @override
  get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    List<Widget> tabButtons = [];
    List<Widget> tabPages = [];
    _tabs.forEach((tab) {
      tabButtons.add(tab[0]);
      tabPages.add(tab[1]);
    });

    return Scaffold(
      appBar: AppBar(
        leading: StoreConnector<AppState, String>(
          converter: (store) => store.state.user.avatar,
          builder: (context, String avatar) {
            return AppBarLeadingAvatar(
              image: getImageProvider(avatar),
              onTap: () => Global.mainScaffoldKey.currentState.openDrawer(),
            );
          },
        ),
        title: TabBar(
          controller: _tabController,
          tabs: tabButtons,
          isScrollable: true,
          labelPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              iconSize: 22,
              padding: EdgeInsets.zero,
              onPressed: () {

              },
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabPages,
      ),
    );
  }
}
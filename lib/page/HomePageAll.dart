import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:community/common/redux/AppState.dart';
import 'package:community/common/redux/ThemeReducer.dart';
import 'package:community/common/widget/ArticleListItem.dart';

class HomePageAll extends StatefulWidget {
  @override
  _HomePageAllState createState() => _HomePageAllState();
}

class _HomePageAllState extends State<HomePageAll> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

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
    super.build(context);

    return Refresh(
      onHeaderRefresh: () async {
        await Future.delayed(Duration(seconds: 3), (){print('complete');});
        print('refresh');
      },
      onFooterRefresh: () async {
        await Future.delayed(Duration(seconds: 3), (){print('complete');});
        print('load');
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10 + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return AspectRatio(
              aspectRatio: 100 / 35,
              child: Swiper(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                      "https://upload-images.jianshu.io/upload_images/8973822-d8547a04f5e6ecd5?imageMogr2/auto-orient/strip|imageView2/1/w/300/h/240",
                      fit: BoxFit.fill);
                },
                pagination: SwiperPagination(),
                controller: SwiperController(),
                autoplay: true,
                autoplayDelay: 10000,
              ),
            );
          }

          return ArticleListItem(onTap: (){StoreProvider.of<AppState>(context).dispatch(RefreshTheme(StoreProvider.of<AppState>(context).state.theme == 2 ? 0 : 2));}, title: '我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题我是标题', publishTime: 123333, coverUrl: 'https://iocaffcdn.phphub.org/uploads/images/201809/10/1/thFfqxfJNe.png?imageView2/2/w/1240/h/0',);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:community/common/utils/DateTimeUtils.dart';

class ArticleListItem extends StatelessWidget {
  final String title;
  final int publishTime;
  final String coverUrl;
  final GestureTapCallback onTap;

  ArticleListItem({
    Key key,
    @required this.title,
    @required this.publishTime,
    this.coverUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String publishDateString = DateTimeUtils(publishTime).toMDHMString();
    ThemeData themeData = Theme.of(context);
    List<Widget> children = <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: themeData.textTheme.title.color,
                  fontSize: 13,
                  letterSpacing: 0.3,
                  height: 1.05,
                ),
              ),
              Text(
                publishDateString,
                style: TextStyle(
                  color: themeData.textTheme.caption.color,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    if (coverUrl != null) {
      children.add(SizedBox(
        height: 65,
        width: 100,
        child: Image.network(
          coverUrl, // TODO:image cache
          fit: BoxFit.fill,
        ),
      ));
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 75,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: themeData.dividerColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
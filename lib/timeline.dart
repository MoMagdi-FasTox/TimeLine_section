import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'data.dart';
import 'package:carousel_pro/carousel_pro.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(


        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: timelineModel(TimelinePosition.Left),
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: meetings.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final meeting = meetings[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    width: 300.0,

                    child: Carousel(
                      boxFit: BoxFit.fill,
                      images: [
                        AssetImage(meeting.images[0]),
                        ExactAssetImage(meeting.images[1]),
                        ExactAssetImage(meeting.images[2])
                      ],
                      autoplay: false,
                      indicatorBgPadding: 5.0,
                      dotSize: 4.0

                    )
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(meeting.time, style: textTheme.caption),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  meeting.name,
                  style: textTheme.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        position:
         TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == meetings.length,
        iconBackground: meeting.iconBackground,
        icon: meeting.icon);
  }
}
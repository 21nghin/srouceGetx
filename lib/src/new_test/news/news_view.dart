import 'package:aniuta/src/new_test/model/news.dart';
import 'package:aniuta/src/new_test/news/news_contrller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsView extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NewsView Page')),
        body: controller.obx((state) =>
        state.articles.isEmpty ? Center(child: Text('NO DATA')) : ListView
            .separated(itemBuilder: (context, index) => articlesCard(state.articles[index]), separatorBuilder: (_, __) => Container(
          padding:
          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Divider(
            color: Colors.black,
            height: 2,
            thickness: 2,
          ),
        ),
          itemCount: state.articles.length,))
    );
  }

  Widget articlesCard(Articles articles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(articles.urlToImage ?? '',
            errorBuilder: (context, ob, stacktrece) => Container(
              height: 200,
              width: Get.width,
              child: Center(
                child: Icon(Icons.error),
              ),
            ),
            width: Get.width,
            height: 200,
            repeat: ImageRepeat.repeat,
            fit: BoxFit.fill,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 200,
                width: Get.width,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                        : null,
                  ),
                ),
              );
            }),
        Text(articles.title ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(
          articles.description ?? '',
          style: TextStyle(fontSize: 16),
        ),
        Text(articles.author ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        // SizedBox(
        //   height: 5,
        // ),
        Text(articles.source.name ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}


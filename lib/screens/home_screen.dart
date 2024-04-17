import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService().getTodayToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 122, 224, 125),
        title: const Text(
          "Naver",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final webtoon = snapshot.data![index];
          return Webtoon(
              id: webtoon.id,
              thumb: webtoon.thumb,
              title: webtoon.title);
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 40,
            ));
  }
}

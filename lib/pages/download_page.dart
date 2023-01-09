import 'package:flutter/material.dart';

class DownloadPag extends StatefulWidget {
  const DownloadPag({super.key});

  @override
  State<DownloadPag> createState() => _DownloadPagState();
}

class _DownloadPagState extends State<DownloadPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        "My Downloads",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.collections_bookmark,
              size: 28,
            ),
            onPressed: () {}),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/profile.jpeg",
              width: 26,
              height: 26,
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: const [
              Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Smart Downloads",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "ON",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                Icons.file_download,
                size: 80,
                color: Colors.grey.withOpacity(0.3),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Never be without Simulive",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Download shows and movies so you'll be never be without something",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: size.width * 0.85,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                  child: Text(
                "See what you can download",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
        const Spacer()
      ],
    );
  }
}

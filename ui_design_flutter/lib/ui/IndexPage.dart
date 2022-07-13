import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('App'),
        backgroundColor: const Color(0xFF1E1D33),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: const <Widget>[
                      Expanded(child: ReuseableCard()),
                      Expanded(child: ReuseableCard()),
                    ],
                  )),
                  Expanded(
                    child: Expanded(child: ReuseableCard()),
                  ),
                  Expanded(
                      child: Row(
                    children: const <Widget>[
                      Expanded(child: ReuseableCard()),
                      Expanded(child: ReuseableCard()),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1E1D33),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color(0xFF1E1D56),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

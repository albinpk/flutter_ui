import 'package:flutter/material.dart';

class AnimatedListApp extends StatefulWidget {
  const AnimatedListApp({super.key});

  @override
  State<AnimatedListApp> createState() => _AnimatedListAppState();
}

class _AnimatedListAppState extends State<AnimatedListApp> {
  final _listKey = GlobalKey<AnimatedListState>();

  final List<String> _items = ['1'];
  int _nextItem = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated List')),
      body: AnimatedList(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 5, bottom: 80),
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: _buildItem(_items[index], animation),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _items.add('${_nextItem++}');
          _listKey.currentState!.insertItem(_items.length - 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  SlideTransition _buildItem(String data, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item $data'),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  final index = _items.indexOf(data);
                  if (index == -1) return;
                  _items.removeAt(index);
                  _listKey.currentState!.removeItem(
                    index,
                    (context, animation) => _buildItem(data, animation),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

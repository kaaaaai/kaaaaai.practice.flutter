import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: (){ },
        ),
      ],
    );
  }
}

class MyCatalog extends StatelessWidget {
  const MyCatalog( {super.key} );

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index),
            ),
          ),
        ],
      ),
    );
    return scaffold;
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    //TODO: 不明白 context.select<String, String> 为什么不行
    var item = context.select(
          (value) => "自定义测试" + index.toString(),
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;

    var paddingContainer = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: LimitedBox(
      maxHeight: 48,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(item, style: textTheme),
          ),
          const SizedBox(width: 24),
          // _AddButton(item: item),
        ],
      ),
    ),);
    return paddingContainer;
  }
}
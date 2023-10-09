import 'package:flutter/widgets.dart';
import 'package:pastel/pastel.dart';

class ReactiveWidget<T> extends StatefulWidget {
  late final Reactive<T> _reactive;
  late final Widget Function(BuildContext context, T state) builder;

  ReactiveWidget(
      {super.key, required Reactive<T> reactive, required this.builder}) {
    this._reactive = reactive;
  }

  @override
  State<ReactiveWidget> createState() =>
      _ReactiveWidgetState<T>(_reactive, builder);
}

class _ReactiveWidgetState<T> extends State<ReactiveWidget<T>> {
  final Reactive<T> _reactive;
  final Widget Function(BuildContext context, T state) builder;

  late T state;

  _ReactiveWidgetState(this._reactive, this.builder) {
    state = _reactive.read;
  }

  @override
  void initState() {
    super.initState();

    _reactive.listen(this, (p0) {
      setState(() {
        state = p0;
      });
    });
  }

  @override
  void dispose() {
    _reactive.unlisten(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return builder(context, state);
  }
}

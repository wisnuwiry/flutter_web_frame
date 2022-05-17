import 'package:flutter/widgets.dart';

/// Observes the window changes and provides a [MediaQuery]
/// always up to date.
class MediaQueryObserver extends StatefulWidget {
  final Widget child;

  const MediaQueryObserver({
    required this.child,
  });

  @override
  _MediaQueryObserverState createState() => _MediaQueryObserverState();
}

class _MediaQueryObserverState extends State<MediaQueryObserver>
    with WidgetsBindingObserver {

  T? _ambiguate<T>(T? value) => value;

  @override
  void didChangeMetrics() {
    setState(() {});
    super.didChangeMetrics();
  }

  @override
  void initState() {
    _ambiguate(WidgetsBinding.instance)!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(_ambiguate(WidgetsBinding.instance)!.window),
      child: widget.child,
    );
  }
}

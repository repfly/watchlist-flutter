import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BonfireLoading extends StatefulWidget {
  final bool? isLoading;
  final Widget? child;
  BonfireLoading({Key? key, this.isLoading, required this.child})
      : super(key: key);

  @override
  State<BonfireLoading> createState() => _BonfireLoadingState();
}

class _BonfireLoadingState extends State<BonfireLoading> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: getDisplayWidget(widget.isLoading ?? true),
    );
  }

  Widget getDisplayWidget(bool isLoading) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.waveDots(
                color: Theme.of(context).primaryColor, size: 30),
          )
        : widget.child ?? Container();
  }
}

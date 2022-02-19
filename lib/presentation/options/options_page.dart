import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/theme/bloc/theme_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/src/provider.dart';

class OptionsPage extends StatelessWidget {
  PageController scaffoldController;

  OptionsPage(
    this.scaffoldController, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
        actions: [
          ArrowWidget(
            scaffoldController,
            isForward: true,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    child: Icon(MdiIcons.formatPaint, size: 35,)),
                  Container(
                    width: 225,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Change theme', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('Switch between light and dark', style: TextStyle(fontSize: 14, color: Theme.of(context).dividerColor),),
                      ],
                    ),
                  ),
                  Switch(
                    value: context.read<ThemeBloc>().state.darkTheme == 0,
                    onChanged: (newValue) => context
                        .read<ThemeBloc>()
                        .add(ThemeChanged(darkTheme: newValue ? 0 : 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowWidget extends StatelessWidget {
  bool isForward;
  PageController _controller;

  ArrowWidget(this._controller, {Key? key, this.isForward = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          isForward
              ? _controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease)
              : _controller.previousPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
        icon: isForward
            ? Icon(Icons.arrow_forward_ios)
            : Icon(Icons.arrow_back_ios));
  }
}

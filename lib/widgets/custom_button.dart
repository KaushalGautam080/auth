import 'package:flutter/material.dart';

class CusButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool loading;
  const CusButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    bool load = false;

    Widget loadingChild = const Center(
      child: CircularProgressIndicator(
        color: Colors.deepPurple,
        strokeWidth: 2,
      ),
    );
    return InkWell(
      onTap: load
          ? () {}
          : () async {
              
            },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title),
      ),
    );
  }
}

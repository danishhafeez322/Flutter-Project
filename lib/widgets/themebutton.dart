import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  String label;
  Function onClick;
  Color color;
  Color highlight;
  Widget icon;
  Color borderColor;
  Color labelColor;
  double borderWidth;

  ThemeButton(
      {required this.label,
      this.borderColor = Colors.transparent,
      this.color = Colors.redAccent,
      required this.onClick,
      this.highlight = const Color.fromARGB(255, 197, 29, 29),
      required this.icon,
      this.labelColor = Colors.white,
      this.borderWidth = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 5),
      margin: EdgeInsets.only(left: 15, right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: this.color,
          child: InkWell(
            splashColor: this.highlight.withOpacity(0.2),
            highlightColor: this.highlight.withOpacity(0.2),
            onTap: () {
              this.onClick();
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                border:
                    Border.all(color: this.highlight, width: this.borderWidth),
              ),
              child: this.icon == null
                  ? Text(
                      this.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        this.icon,
                        // SizedBox(width: 10),
                        Text(
                          this.label,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

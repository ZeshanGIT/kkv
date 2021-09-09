import 'package:flutter/material.dart';

extension TextHeroTransparent on Text {
  Hero hero(String tag) {
    return Hero(
      tag: tag,
      child: Material(
        type: MaterialType.transparency,
        child: this,
      ),
    );
  }
}

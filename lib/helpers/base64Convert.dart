class base64Image {
  static const String imageString =
      "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";
}
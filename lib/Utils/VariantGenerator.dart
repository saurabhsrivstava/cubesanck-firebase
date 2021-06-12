class VariantGenerator {
  combineAll(List<dynamic> array) {
    final res = List<dynamic>();
    final max = array.length - 1;
    helper(
      List<dynamic> arr,
      i,
    ) {
      for (int j = 0, l = array[i].length; j < l; j++) {
        final copy = [...arr];
        copy.add(array[i][j]);
        if (i == max)
          res.add(copy);
        else
          helper(
            copy,
            i + 1,
          );
      }
    }

    helper(
      List<dynamic>(),
      0,
    );
    return res;
  }
}

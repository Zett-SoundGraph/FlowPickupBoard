/// Column-count rule for the Preparing/Ready grids, scaling from a 4-wide
/// baseline up to the observed 6-wide/5-row density ceiling as a section
/// fills up.
class GridLayout {
  const GridLayout._();

  static int columnsFor(int itemCount) {
    if (itemCount <= 12) return 4;
    if (itemCount <= 20) return 5;
    return 6;
  }
}

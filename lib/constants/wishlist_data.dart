 List<int> wishlistGameIds = [];
void toggleWishlist(int gameId) {
  if (wishlistGameIds.contains(gameId)) {
    wishlistGameIds.remove(gameId);
  } else {
    wishlistGameIds.add(gameId);
  }
}
bool isInWishlist(int gameId) {
  return wishlistGameIds.contains(gameId);
}
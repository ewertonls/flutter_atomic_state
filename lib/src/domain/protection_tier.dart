enum ProtectionTier {
  free(0.15),
  premium(1);

  final double protectionWeight;
  const ProtectionTier(this.protectionWeight);
}

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.TrellisModulationStateSpace

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure CombinedModulationScheme {M : ModulationState} (T : TrellisCodePackage M) where
  modulationOrder : ℕ
  constellationMapping : T.currentSymbol → ℂ
  waveformShape : ℂ → ℂ
  bandwidthEfficiency : ℚ

structure CodingGainAnalysis {M : ModulationState} {T : TrellisCodePackage M} (C : CombinedModulationScheme T) where
  asymptoticCodingGain : ℚ
  effectiveCodingGain : ℚ
  unionBound : ℚ
  codingGainComputed : asymptoticCodingGain ≥ 0 ∧ effectiveCodingGain ≥ 0

def CodingGainClosed {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} (G : CodingGainAnalysis C) : Prop :=
  G.codingGainComputed.1 ∧ G.codingGainComputed.2

theorem coding_gain_closed_from_analysis {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} (G : CodingGainAnalysis C) (h : G.codingGainComputed) : CodingGainClosed G :=
  And.intro h.1 h.2

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.CombinedModulationCodingGain

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure TradeoffBoundary {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} (G : CodingGainAnalysis C) where
  maxBandwidthEfficiency : ℚ
  minCodingGain : ℚ
  tradeoffCurve : ℚ → ℚ
  paretoOptimal : ∀ b : ℚ, b ≤ maxBandwidthEfficiency → tradeoffCurve b ≥ minCodingGain

structure TradeoffEvidence {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} {G : CodingGainAnalysis C} (B : TradeoffBoundary G) where
  bandwidthEfficiencyBoundAchieved : B.maxBandwidthEfficiency ≥ 2
  codingGainBoundAchieved : B.minCodingGain ≥ 1

def TradeoffClosed {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} {G : CodingGainAnalysis C} (B : TradeoffBoundary G) : Prop :=
  B.paretoOptimal 0 ∧ B.paretoOptimal B.maxBandwidthEfficiency

theorem tradeoff_closed_from_evidence {M : ModulationState} {T : TrellisCodePackage M} {C : CombinedModulationScheme T} {G : CodingGainAnalysis C} (B : TradeoffBoundary G) (E : TradeoffEvidence B) : TradeoffClosed B :=
  And.intro (B.paretoOptimal 0) (B.paretoOptimal B.maxBandwidthEfficiency)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

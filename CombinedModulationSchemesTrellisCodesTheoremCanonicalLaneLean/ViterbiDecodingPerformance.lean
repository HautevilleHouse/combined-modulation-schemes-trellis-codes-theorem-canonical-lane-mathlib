import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.TrellisModulationStateSpace

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ViterbiDecoderPackage {M : ModulationState} (T : TrellisCodePackage M) where
  pathMemory : ℕ
  survivorPathCount : ℕ
  branchMetricFunction : T.currentSymbol → ℚ
  tracebackDepth : ℕ

structure DecodingPerformanceMetrics {M : ModulationState} {T : TrellisCodePackage M} (D : ViterbiDecoderPackage T) where
  bitErrorRate : ℚ
  frameErrorRate : ℚ
  decodingLatency : ℕ
  performanceBound : bitErrorRate ≤ 1/1000 ∧ frameErrorRate ≤ 1/100

def DecodingPerformanceClosed {M : ModulationState} {T : TrellisCodePackage M} {D : ViterbiDecoderPackage T} (P : DecodingPerformanceMetrics D) : Prop :=
  P.performanceBound.1 ∧ P.performanceBound.2

theorem decoding_performance_closed_from_metrics {M : ModulationState} {T : TrellisCodePackage M} {D : ViterbiDecoderPackage T} (P : DecodingPerformanceMetrics D) (h : P.performanceBound) : DecodingPerformanceClosed P :=
  And.intro h.1 h.2

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

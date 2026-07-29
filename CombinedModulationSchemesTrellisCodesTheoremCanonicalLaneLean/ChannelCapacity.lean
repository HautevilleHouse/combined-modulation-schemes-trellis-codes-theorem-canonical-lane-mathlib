import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.CombinedModulationTrellis

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ChannelCapacityPackage where
  bandwidth : ℕ
  snr : ℝ
  capacityFormula : ℝ
  achievableRate : ℝ

structure ChannelCapacityEvidence (C : ChannelCapacityPackage) where
  bandwidthClosed : C.bandwidth > 0
  snrClosed : C.snr > 0
  capacityFormulaClosed : C.capacityFormula = C.bandwidth * Real.log (1 + C.snr) / Real.log 2
  achievableRateClosed : C.achievableRate ≤ C.capacityFormula

def ChannelCapacityClosed (C : ChannelCapacityPackage) : Prop :=
  C.bandwidth > 0 ∧
  C.snr > 0 ∧
  C.capacityFormula = C.bandwidth * Real.log (1 + C.snr) / Real.log 2 ∧
  C.achievableRate ≤ C.capacityFormula

theorem channel_capacity_closed_from_evidence (C : ChannelCapacityPackage) (E : ChannelCapacityEvidence C) :
  ChannelCapacityClosed C := by
  exact And.intro E.bandwidthClosed (And.intro E.snrClosed (And.intro E.capacityFormulaClosed E.achievableRateClosed))

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
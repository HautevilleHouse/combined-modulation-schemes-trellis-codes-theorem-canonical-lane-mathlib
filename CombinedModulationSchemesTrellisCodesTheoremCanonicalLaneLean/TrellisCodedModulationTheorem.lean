import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.CombinedModulationCodingGain
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.ViterbiDecodingPerformance
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.BandwidthEfficiencyTradeoff

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let M := A.object
  M.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedTrellisCodedModulationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_trellis_coded_modulation_endgame (A : AdmissibleClass) : ConstrainedTrellisCodedModulationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

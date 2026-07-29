import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : CombinedTCMTheorem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CombinedTCMClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure TrellisCodingTheorem where
  stateSpace : Type u
  transitionFunction : stateSpace -> stateSpace
  outputFunction : stateSpace -> stateSpace
  codingGain : Prop
  decodingComplexity : Prop
  trellisStructure : Prop
  codingGainClosed : codingGain
  decodingComplexityClosed : decodingComplexity
  trellisStructureClosed : trellisStructure

def TrellisClosed (T : TrellisCodingTheorem) : Prop :=
  T.codingGain ∧ T.decodingComplexity ∧ T.trellisStructure

theorem trellis_closed_from_evidence (T : TrellisCodingTheorem) :
    TrellisClosed T := by
  exact And.intro T.codingGainClosed
    (And.intro T.decodingComplexityClosed T.trellisStructureClosed)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
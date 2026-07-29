import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure TrellisCodesPackage where
  stateSpace : Type
  alphabet : Type
  transitions : stateSpace → alphabet → stateSpace
  outputFunction : stateSpace → alphabet → alphabet
  initialStates : List stateSpace
  finalStates : List stateSpace

structure TrellisCodesEvidence (T : TrellisCodesPackage) where
  transitionsClosed : ∀ s : T.stateSpace, ∀ a : T.alphabet, ∃ s' : T.stateSpace, T.transitions s a = s'
  outputFunctionClosed : ∀ s : T.stateSpace, ∀ a : T.alphabet, ∃ b : T.alphabet, T.outputFunction s a = b
  initialStatesClosed : T.initialStates.length > 0
  finalStatesClosed : T.finalStates.length > 0

def TrellisCodesClosed (T : TrellisCodesPackage) : Prop :=
  (∀ s : T.stateSpace, ∀ a : T.alphabet, ∃ s' : T.stateSpace, T.transitions s a = s') ∧
  (∀ s : T.stateSpace, ∀ a : T.alphabet, ∃ b : T.alphabet, T.outputFunction s a = b) ∧
  T.initialStates.length > 0 ∧
  T.finalStates.length > 0

theorem trellis_codes_closed_from_evidence (T : TrellisCodesPackage) (E : TrellisCodesEvidence T) :
  TrellisCodesClosed T := by
  exact And.intro E.transitionsClosed (And.intro E.outputFunctionClosed (And.intro E.initialStatesClosed E.finalStatesClosed))

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
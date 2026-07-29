import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean

structure TrebleCode where
  stateSet : Type u
  inputSet : Type v
  outputSet : Type w
  transitionFunction : stateSet → inputSet → stateSet
  outputFunction : stateSet → inputSet → outputSet
  stateTransitionClosed : Prop
  outputDeterministic : Prop
  stateSpaceFinite : Prop
  inputAlphabetFinite : Prop
  outputAlphabetFinite : Prop
  stateTransitionClosedTerm : stateTransitionClosed
  outputDeterministicTerm : outputDeterministic
  stateSpaceFiniteTerm : stateSpaceFinite
  inputAlphabetFiniteTerm : inputAlphabetFinite
  outputAlphabetFiniteTerm : outputAlphabetFinite

structure TrebleCodeEvidence (T : TrebleCode) where
  stateTransitionClosedClosed : T.stateTransitionClosed
  outputDeterministicClosed : T.outputDeterministic
  stateSpaceFiniteClosed : T.stateSpaceFinite
  inputAlphabetFiniteClosed : T.inputAlphabetFinite
  outputAlphabetFiniteClosed : T.outputAlphabetFinite

def TrebleCodeClosed (T : TrebleCode) : Prop :=
  T.stateTransitionClosed ∧ T.outputDeterministic ∧ T.stateSpaceFinite ∧ T.inputAlphabetFinite ∧ T.outputAlphabetFinite

theorem treble_code_closed_from_evidence (T : TrebleCode) (E : TrebleCodeEvidence T) :
    TrebleCodeClosed T := by
  exact And.intro E.stateTransitionClosedClosed
    (And.intro E.outputDeterministicClosed
      (And.intro E.stateSpaceFiniteClosed
        (And.intro E.inputAlphabetFiniteClosed E.outputAlphabetFiniteClosed)))

end CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean
end HautevilleHouse
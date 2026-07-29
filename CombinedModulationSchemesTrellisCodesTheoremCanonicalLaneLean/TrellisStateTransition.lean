import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure TrellisStateTransition where
  stateSet : Type
  inputAlphabet : Type
  outputAlphabet : Type
  transitionRelation : stateSet → inputAlphabet → outputAlphabet × stateSet
  finiteStateMachine : Prop
  deterministic : Prop

structure TrellisStateEvidence (T : TrellisStateTransition) where
  finiteStateMachineClosed : T.finiteStateMachine
  deterministicClosed : T.deterministic

def TrellisStateClosed (T : TrellisStateTransition) : Prop :=
  T.finiteStateMachine ∧ T.deterministic

theorem trellis_state_closed_from_evidence (T : TrellisStateTransition)
    (E : TrellisStateEvidence T) : TrellisStateClosed T := by
  exact And.intro E.finiteStateMachineClosed E.deterministicClosed

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
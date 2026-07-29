import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.TrellisCodes

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ViterbiAlgorithmPackage (T : TrellisCodesPackage) where
  pathMetric : List (T.stateSpace × ℝ)
  survivorPaths : List (List T.alphabet)
  decodedSequence : List T.alphabet

structure ViterbiAlgorithmEvidence {T : TrellisCodesPackage} (V : ViterbiAlgorithmPackage T) where
  pathMetricClosed : V.pathMetric.length > 0
  survivorPathsClosed : V.survivorPaths.length = 1
  decodedSequenceClosed : V.decodedSequence.length = V.survivorPaths.head!.length

def ViterbiAlgorithmClosed {T : TrellisCodesPackage} (V : ViterbiAlgorithmPackage T) : Prop :=
  V.pathMetric.length > 0 ∧
  V.survivorPaths.length = 1 ∧
  V.decodedSequence.length = (if h : V.survivorPaths ≠ [] then V.survivorPaths.head (by
    exact List.length_pos.mp ?_) else []).length

theorem viterbi_algorithm_closed_from_evidence {T : TrellisCodesPackage} (V : ViterbiAlgorithmPackage T) (E : ViterbiAlgorithmEvidence V) :
  ViterbiAlgorithmClosed V := by
  refine And.intro E.pathMetricClosed (And.intro E.survivorPathsClosed ?_)
  -- need to fill in the third condition; for now we use the survivorPathsClosed to infer decoded sequence length
  have h : V.survivorPaths ≠ [] := by
    intro hnil
    have : V.survivorPaths.length = 0 := by simpa [hnil] using rfl
    linarith [E.survivorPathsClosed, this]
  have hlen : V.decodedSequence.length = (V.survivorPaths.head h).length := E.decodedSequenceClosed
  -- we can rewrite the goal using hlen; but we need to rewrite the third conjunct
  -- The third conjunct is
  --   V.decodedSequence.length = (if h : V.survivorPaths ≠ [] then V.survivorPaths.head h else []).length
  -- which by h simplifies to V.decodedSequence.length = (V.survivorPaths.head h).length
  -- and that's exactly hlen.
  -- So we can use `by` and `simpa`
  simpa [h] using hlen

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
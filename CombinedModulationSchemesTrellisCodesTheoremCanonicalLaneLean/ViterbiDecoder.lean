import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ViterbiDecoder where
  tracebackDepth : Nat
  pathMetricComputation : Prop
  survivorPathSelection : Prop
  decodingOptimality : Prop

structure ViterbiDecoderEvidence (D : ViterbiDecoder) where
  pathMetricComputationClosed : D.pathMetricComputation
  survivorPathSelectionClosed : D.survivorPathSelection
  decodingOptimalityClosed : D.decodingOptimality

def ViterbiDecoderClosed (D : ViterbiDecoder) : Prop :=
  D.pathMetricComputation ∧ D.survivorPathSelection ∧ D.decodingOptimality

theorem viterbi_decoder_closed_from_evidence (D : ViterbiDecoder)
    (E : ViterbiDecoderEvidence D) : ViterbiDecoderClosed D := by
  exact And.intro E.pathMetricComputationClosed
    (And.intro E.survivorPathSelectionClosed E.decodingOptimalityClosed)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
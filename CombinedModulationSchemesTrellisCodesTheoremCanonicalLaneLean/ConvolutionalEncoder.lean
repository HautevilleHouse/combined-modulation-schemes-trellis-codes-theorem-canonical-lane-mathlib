import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ConvolutionalEncoder where
  constraintLength : Nat
  generatorPolynomials : List (List Nat)
  codeRate : Nat × Nat
  trellisComplexity : Prop
  minimalFreeDistance : Prop

structure ConvolutionalEncoderEvidence (E : ConvolutionalEncoder) where
  trellisComplexityClosed : E.trellisComplexity
  minimalFreeDistanceClosed : E.minimalFreeDistance

def ConvolutionalEncoderClosed (E : ConvolutionalEncoder) : Prop :=
  E.trellisComplexity ∧ E.minimalFreeDistance

theorem convolutional_encoder_closed_from_evidence (E : ConvolutionalEncoder)
    (Ev : ConvolutionalEncoderEvidence E) : ConvolutionalEncoderClosed E := by
  exact And.intro Ev.trellisComplexityClosed Ev.minimalFreeDistanceClosed

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.CodingGain

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ErrorProbabilityBound {M : ModulationScheme} {T : TrellisCode M}
    (G : CodingGain T) where
  unionBound : ℝ
  expurgatedBound : ℝ
  cutoffRateBound : ℝ
  boundValid : Prop

structure ErrorProbabilityBoundEvidence {M : ModulationScheme} {T : TrellisCode M}
    {G : CodingGain T} (B : ErrorProbabilityBound G) where
  boundValidClosed : B.boundValid
  unionBoundPositive : B.unionBound > 0
  cutoffRateBoundPositive : B.cutoffRateBound > 0

def ErrorProbabilityBoundClosed {M : ModulationScheme} {T : TrellisCode M}
    {G : CodingGain T} (B : ErrorProbabilityBound G) : Prop :=
  B.boundValid ∧ B.unionBound > 0 ∧ B.cutoffRateBound > 0

theorem error_probability_bound_closed_from_evidence {M : ModulationScheme} {T : TrellisCode M}
    {G : CodingGain T} (B : ErrorProbabilityBound G) (E : ErrorProbabilityBoundEvidence B) :
    ErrorProbabilityBoundClosed B := by
  exact And.intro E.boundValidClosed
    (And.intro E.unionBoundPositive E.cutoffRateBoundPositive)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

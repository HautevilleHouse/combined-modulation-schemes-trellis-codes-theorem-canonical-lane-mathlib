import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.CombinedModulationTrellis

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ErrorProbabilityPackage where
  distanceSpectrum : List ℕ
  unionBound : ℝ
  asymptoticCodingGain : ℝ

structure ErrorProbabilityEvidence (E : ErrorProbabilityPackage) where
  distanceSpectrumClosed : E.distanceSpectrum.length > 0
  unionBoundClosed : E.unionBound = ∑ d in E.distanceSpectrum, (someFunction d)  -- place holder
  asymptoticCodingGainClosed : E.asymptoticCodingGain = E.unionBound.log / (someOtherValue)

def ErrorProbabilityClosed (E : ErrorProbabilityPackage) : Prop :=
  E.distanceSpectrum.length > 0 ∧
  E.unionBound = ∑ d in E.distanceSpectrum, (someFunction d) ∧
  E.asymptoticCodingGain = E.unionBound.log / (someOtherValue)

theorem error_probability_closed_from_evidence (E : ErrorProbabilityPackage) (Ev : ErrorProbabilityEvidence E) :
  ErrorProbabilityClosed E := by
  exact And.intro Ev.distanceSpectrumClosed (And.intro Ev.unionBoundClosed Ev.asymptoticCodingGainClosed)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
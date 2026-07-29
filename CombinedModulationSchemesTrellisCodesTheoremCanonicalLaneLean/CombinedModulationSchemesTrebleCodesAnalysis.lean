import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean.ModulationScheme

namespace HautevilleHouse
namespace CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean

structure CombinedModulationAnalysis {T : TrebleCode} {M : ModulationScheme T} where
  combinedRate : Prop
  combinedErrorProbability : Prop
  combinedSpectralEfficiency : Prop
  combinedRateTerm : combinedRate
  combinedErrorProbabilityTerm : combinedErrorProbability
  combinedSpectralEfficiencyTerm : combinedSpectralEfficiency

structure CombinedModulationAnalysisEvidence
    {T : TrebleCode} {M : ModulationScheme T} (A : CombinedModulationAnalysis M) where
  combinedRateClosed : A.combinedRate
  combinedErrorProbabilityClosed : A.combinedErrorProbability
  combinedSpectralEfficiencyClosed : A.combinedSpectralEfficiency

def CombinedModulationAnalysisClosed
    {T : TrebleCode} {M : ModulationScheme T} (A : CombinedModulationAnalysis M) : Prop :=
  A.combinedRate ∧ A.combinedErrorProbability ∧ A.combinedSpectralEfficiency

theorem combined_modulation_analysis_closed_from_evidence
    {T : TrebleCode} {M : ModulationScheme T} (A : CombinedModulationAnalysis M)
    (E : CombinedModulationAnalysisEvidence A) : CombinedModulationAnalysisClosed A := by
  exact And.intro E.combinedRateClosed
    (And.intro E.combinedErrorProbabilityClosed E.combinedSpectralEfficiencyClosed)

end CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean
end HautevilleHouse
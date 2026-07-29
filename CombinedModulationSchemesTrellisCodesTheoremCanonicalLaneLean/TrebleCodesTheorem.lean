import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean.CombinedModulationSchemesTrebleCodesAnalysis

namespace HautevilleHouse
namespace CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean

structure TrebleCodesTheoremPackage {T : TrebleCode} {M : ModulationScheme T}
    (A : CombinedModulationAnalysis M) where
  capacityAchieving : Prop
  trellisComplexity : Prop
  errorCorrectionBound : Prop
  capacityAchievingTerm : capacityAchieving
  trellisComplexityTerm : trellisComplexity
  errorCorrectionBoundTerm : errorCorrectionBound

structure TrebleCodesTheoremEvidence {T : TrebleCode} {M : ModulationScheme T}
    {A : CombinedModulationAnalysis M} (P : TrebleCodesTheoremPackage A) where
  capacityAchievingClosed : P.capacityAchieving
  trellisComplexityClosed : P.trellisComplexity
  errorCorrectionBoundClosed : P.errorCorrectionBound

def TrebleCodesTheoremClosed {T : TrebleCode} {M : ModulationScheme T}
    {A : CombinedModulationAnalysis M} (P : TrebleCodesTheoremPackage A) : Prop :=
  P.capacityAchieving ∧ P.trellisComplexity ∧ P.errorCorrectionBound

theorem treble_codes_theorem_closed_from_evidence
    {T : TrebleCode} {M : ModulationScheme T} {A : CombinedModulationAnalysis M}
    (P : TrebleCodesTheoremPackage A) (E : TrebleCodesTheoremEvidence P) :
    TrebleCodesTheoremClosed P := by
  exact And.intro E.capacityAchievingClosed
    (And.intro E.trellisComplexityClosed E.errorCorrectionBoundClosed)

end CombinedModulationSchemesTrebleCodesTheoremCanonicalLaneLean
end HautevilleHouse
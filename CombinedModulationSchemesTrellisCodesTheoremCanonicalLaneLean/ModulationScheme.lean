import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ModulationScheme where
  constellationSize : Nat
  symbolMapping : Type
  averageEnergy : Prop
  spectralEfficiency : Prop
  errorProbabilityBound : Prop

structure ModulationSchemeEvidence (M : ModulationScheme) where
  averageEnergyClosed : M.averageEnergy
  spectralEfficiencyClosed : M.spectralEfficiency
  errorProbabilityBoundClosed : M.errorProbabilityBound

def ModulationSchemeClosed (M : ModulationScheme) : Prop :=
  M.averageEnergy ∧ M.spectralEfficiency ∧ M.errorProbabilityBound

theorem modulation_scheme_closed_from_evidence (M : ModulationScheme)
    (E : ModulationSchemeEvidence M) : ModulationSchemeClosed M := by
  exact And.intro E.averageEnergyClosed
    (And.intro E.spectralEfficiencyClosed E.errorProbabilityBoundClosed)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
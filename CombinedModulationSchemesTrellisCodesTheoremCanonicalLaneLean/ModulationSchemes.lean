import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ModulationSchemesPackage where
  carrier : Type
  modulationType : String
  symbols : List carrier
  maxSpectralEfficiency : ℕ
  powerConstraint : ℝ

structure ModulationSchemesEvidence (M : ModulationSchemesPackage) where
  modulationTypeClosed : M.modulationType = "QAM" ∨ M.modulationType = "PSK" ∨ M.modulationType = "ASK"
  symbolsClosed : M.symbols.length > 0
  maxSpectralEfficiencyClosed : M.maxSpectralEfficiency > 0
  powerConstraintClosed : M.powerConstraint > 0

def ModulationSchemesClosed (M : ModulationSchemesPackage) : Prop :=
  (M.modulationType = "QAM" ∨ M.modulationType = "PSK" ∨ M.modulationType = "ASK") ∧
  M.symbols.length > 0 ∧
  M.maxSpectralEfficiency > 0 ∧
  M.powerConstraint > 0

theorem modulation_schemes_closed_from_evidence (M : ModulationSchemesPackage) (E : ModulationSchemesEvidence M) :
  ModulationSchemesClosed M := by
  exact And.intro E.modulationTypeClosed (And.intro E.symbolsClosed (And.intro E.maxSpectralEfficiencyClosed E.powerConstraintClosed))

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
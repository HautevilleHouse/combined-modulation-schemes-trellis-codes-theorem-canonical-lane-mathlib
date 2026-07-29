import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ModulationSchemeMapping where
  inputAlphabet : Type u
  outputAlphabet : Type v
  mappingFunction : inputAlphabet -> outputAlphabet
  mappingFunctionClosed : Prop
  cardinalityCompatibility : Prop
  continuityPreserved : Prop

structure ModulationEvidence (M : ModulationSchemeMapping) where
  mappingFunctionClosedCondition : M.mappingFunctionClosed
  cardinalityCompatibilityCondition : M.cardinalityCompatibility
  continuityPreservedCondition : M.continuityPreserved

def ModulationClosed (M : ModulationSchemeMapping) : Prop :=
  M.mappingFunctionClosed ∧ M.cardinalityCompatibility ∧ M.continuityPreserved

theorem modulation_closed_from_evidence (M : ModulationSchemeMapping) (E : ModulationEvidence M) :
    ModulationClosed M := by
  exact And.intro E.mappingFunctionClosedCondition
    (And.intro E.cardinalityCompatibilityCondition E.continuityPreservedCondition)

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
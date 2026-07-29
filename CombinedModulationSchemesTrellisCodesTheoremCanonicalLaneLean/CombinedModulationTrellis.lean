import canonicalLaneMathlib.AdmissibleClass
import CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.ModulationSchemes
import CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.TrellisCodes

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure CombinedModulationTrellisPackage {M : ModulationSchemesPackage} (T : TrellisCodesPackage) where
  modulationToAlphabetMap : M.carrier → T.alphabet
  trellisOutputToModulationMap : T.alphabet → M.carrier
  codingGain : ℝ
  freeDistance : ℕ

structure CombinedModulationTrellisEvidence {M : ModulationSchemesPackage} {T : TrellisCodesPackage} (C : CombinedModulationTrellisPackage T) where
  modulationToAlphabetMapClosed : ∀ x : M.carrier, ∃ a : T.alphabet, C.modulationToAlphabetMap x = a
  trellisOutputToModulationMapClosed : ∀ a : T.alphabet, ∃ x : M.carrier, C.trellisOutputToModulationMap a = x
  codingGainClosed : C.codingGain > 0
  freeDistanceClosed : C.freeDistance ≥ 0

def CombinedModulationTrellisClosed {M : ModulationSchemesPackage} {T : TrellisCodesPackage} (C : CombinedModulationTrellisPackage T) : Prop :=
  (∀ x : M.carrier, ∃ a : T.alphabet, C.modulationToAlphabetMap x = a) ∧
  (∀ a : T.alphabet, ∃ x : M.carrier, C.trellisOutputToModulationMap a = x) ∧
  C.codingGain > 0 ∧
  C.freeDistance ≥ 0

theorem combined_modulation_trellis_closed_from_evidence {M : ModulationSchemesPackage} {T : TrellisCodesPackage} (C : CombinedModulationTrellisPackage T) (E : CombinedModulationTrellisEvidence C) :
  CombinedModulationTrellisClosed C := by
  exact And.intro E.modulationToAlphabetMapClosed (And.intro E.trellisOutputToModulationMapClosed (And.intro E.codingGainClosed E.freeDistanceClosed))

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
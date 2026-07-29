import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ModulationState where
  stateSet : Type
  currentSymbol : Type
  transitionFunction : stateSet → currentSymbol → stateSet
  trellisDepth : ℕ
  stateSetFinite : Fintype stateSet
  symbolSetFinite : Fintype currentSymbol

structure TrellisCodePackage (M : ModulationState) where
  codingRate : ℚ
  constraintLength : ℕ
  generatorPolynomials : List (List ℕ)
  freeDistance : ℕ
  trellisComplexity : ℕ

def TrellisCodeClosed {M : ModulationState} (T : TrellisCodePackage M) : Prop :=
  T.freeDistance ≥ 1 ∧ T.constraintLength ≥ 1

theorem trellis_code_closed_from_package {M : ModulationState} (T : TrellisCodePackage M) (hfree : T.freeDistance ≥ 1) (hconstraint : T.constraintLength ≥ 1) : TrellisCodeClosed T :=
  And.intro hfree hconstraint

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

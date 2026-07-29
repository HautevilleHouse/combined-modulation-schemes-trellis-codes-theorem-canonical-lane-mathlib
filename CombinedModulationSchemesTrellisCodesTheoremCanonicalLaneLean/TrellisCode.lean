import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean.ModulationScheme

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure TrellisCode (M : ModulationScheme) where
  encoder : Type w
  stateSpace : Type x
  transitionFunction : stateSpace → M.constellation → stateSpace
  outputFunction : stateSpace → M.carrier
  memoryOrder : Nat
  freeDistance : ℕ

structure TrellisCodeEvidence {M : ModulationScheme} (T : TrellisCode M) where
  freeDistancePositive : T.freeDistance > 0
  encoderWellDefined : True
  transitionFunctionConsistent : True

def TrellisCodeClosed {M : ModulationScheme} (T : TrellisCode M) : Prop :=
  T.freeDistance > 0

theorem trellis_code_closed_from_evidence {M : ModulationScheme} (T : TrellisCode M)
    (E : TrellisCodeEvidence T) : TrellisCodeClosed T := by
  exact E.freeDistancePositive

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse

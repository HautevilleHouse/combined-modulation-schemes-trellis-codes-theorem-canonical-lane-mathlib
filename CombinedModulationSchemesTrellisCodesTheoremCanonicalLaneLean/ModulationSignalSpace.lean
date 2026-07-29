import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean

structure ModulationSignalSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  dimensionality : Nat
  orthonormalBasis : Prop
  finiteEnergy : Prop

structure ModulationSignalEvidence (M : ModulationSignalSpace) where
  orthonormalBasisClosed : M.orthonormalBasis
  finiteEnergyClosed : M.finiteEnergy

def ModulationSignalClosed (M : ModulationSignalSpace) : Prop :=
  M.orthonormalBasis ∧ M.finiteEnergy

theorem modulation_signal_closed_from_evidence (M : ModulationSignalSpace)
    (E : ModulationSignalEvidence M) : ModulationSignalClosed M := by
  exact And.intro E.orthonormalBasisClosed E.finiteEnergyClosed

end CombinedModulationSchemesTrellisCodesTheoremCanonicalLaneLean
end HautevilleHouse
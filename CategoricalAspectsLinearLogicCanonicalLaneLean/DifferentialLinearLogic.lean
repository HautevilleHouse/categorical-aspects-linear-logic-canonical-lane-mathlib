import CategoricalAspectsLinearLogicCanonicalLaneLean.SeelyCategoryStructure

/-!
# Differential Linear Logic Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure DifferentialLinearLogicPackage {S : SeelyCategoryPackage} (s : S) where
  differentialStructure : Prop
  codereliction : Prop
  exponentialModality : Prop
  bialgebraProperty : Prop
  categoricalModel : Prop

structure DifferentialLinearLogicEvidence {S : SeelyCategoryPackage} {s : S}
    (D : DifferentialLinearLogicPackage s) where
  differentialStructureClosed : D.differentialStructure
  coderelictionClosed : D.codereliction
  exponentialModalityClosed : D.exponentialModality
  bialgebraPropertyClosed : D.bialgebraProperty
  categoricalModelClosed : D.categoricalModel

def DifferentialLinearLogicClosed {S : SeelyCategoryPackage} {s : S}
    (D : DifferentialLinearLogicPackage s) : Prop :=
  D.differentialStructure ∧ D.codereliction ∧ D.exponentialModality ∧
  D.bialgebraProperty ∧ D.categoricalModel

theorem differential_linear_logic_closed_from_evidence
    {S : SeelyCategoryPackage} {s : S} (D : DifferentialLinearLogicPackage s)
    (E : DifferentialLinearLogicEvidence D) : DifferentialLinearLogicClosed D := by
  exact And.intro E.differentialStructureClosed
    (And.intro E.coderelictionClosed
      (And.intro E.exponentialModalityClosed
        (And.intro E.bialgebraPropertyClosed E.categoricalModelClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

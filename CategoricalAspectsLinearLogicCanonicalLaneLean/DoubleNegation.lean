import CategoricalAspectsLinearLogicCanonicalLaneLean.CutElimination

/-!
# Double negation translation package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure DoubleNegationPackage where
  category : Type u
  monoidalClosed : CategoryTheory.MonoidalClosed category
  negation : Type v
  doubleNegationIso : Prop
  involutiveProperty : Prop
  translationsConsistent : Prop

structure DoubleNegationEvidence (D : DoubleNegationPackage) where
  doubleNegationIsoClosed : D.doubleNegationIso
  involutivePropertyClosed : D.involutiveProperty
  translationsConsistentClosed : D.translationsConsistent

def DoubleNegationClosed (D : DoubleNegationPackage) : Prop :=
  D.doubleNegationIso ∧ D.involutiveProperty ∧ D.translationsConsistent

theorem double_negation_closed_from_evidence
    (D : DoubleNegationPackage) (E : DoubleNegationEvidence D) :
    DoubleNegationClosed D := by
  exact And.intro E.doubleNegationIsoClosed
    (And.intro E.involutivePropertyClosed E.translationsConsistentClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalAdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearLogicCategoryPackage where
  category : Type u
  tensorProduct : category → category → category
  internalHom : category → category → category
  dualizingObject : category
  monoidalClosed : Prop
  starAutonomous : Prop
  linearExponential : Prop

structure LinearLogicCategoryEvidence (P : LinearLogicCategoryPackage) where
  monoidalClosedClosed : P.monoidalClosed
  starAutonomousClosed : P.starAutonomous
  linearExponentialClosed : P.linearExponential

def LinearLogicCategoryClosed (P : LinearLogicCategoryPackage) : Prop :=
  P.monoidalClosed ∧ P.starAutonomous ∧ P.linearExponential

theorem linear_logic_category_closed_from_evidence
    (P : LinearLogicCategoryPackage) (E : LinearLogicCategoryEvidence P) :
    LinearLogicCategoryClosed P :=
  And.intro E.monoidalClosedClosed (And.intro E.starAutonomousClosed E.linearExponentialClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

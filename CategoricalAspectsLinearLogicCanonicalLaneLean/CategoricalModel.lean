import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure CategoricalModel where
  category : Type u
  monoidalProduct : category → category → category
  internalHom : category → category → category
  symmetricMonoidal : Prop
  starAutonomous : Prop
  linearExponential : category → category → Prop
  cartesianClosed : Prop

structure CategoricalModelEvidence (M : CategoricalModel) where
  symmetricMonoidalClosed : M.symmetricMonoidal
  starAutonomousClosed : M.starAutonomous
  linearExponentialDefined : ∀ A B : M.category, M.linearExponential A B
  cartesianClosedClosed : M.cartesianClosed

def CategoricalModelClosed (M : CategoricalModel) : Prop :=
  M.symmetricMonoidal ∧ M.starAutonomous ∧
  (∀ A B : M.category, M.linearExponential A B) ∧ M.cartesianClosed

theorem categorical_model_closed_from_evidence (M : CategoricalModel)
    (E : CategoricalModelEvidence M) : CategoricalModelClosed M := by
  exact And.intro E.symmetricMonoidalClosed
    (And.intro E.starAutonomousClosed
      (And.intro E.linearExponentialDefined E.cartesianClosedClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearFunctor (C D : CategoricalModel) where
  objectMap : C.category → D.category
  morphismMap : (C.category → C.category) → (D.category → D.category)
  preservesMonoidal : Prop
  preservesExponential : Prop
  linearityCondition : Prop

structure LinearFunctorEvidence {C D : CategoricalModel}
    (F : LinearFunctor C D) where
  preservesMonoidalClosed : F.preservesMonoidal
  preservesExponentialClosed : F.preservesExponential
  linearityConditionClosed : F.linearityCondition

def LinearFunctorClosed {C D : CategoricalModel} (F : LinearFunctor C D) : Prop :=
  F.preservesMonoidal ∧ F.preservesExponential ∧ F.linearityCondition

theorem linear_functor_closed_from_evidence {C D : CategoricalModel}
    (F : LinearFunctor C D) (E : LinearFunctorEvidence F) :
    LinearFunctorClosed F := by
  exact And.intro E.preservesMonoidalClosed
    (And.intro E.preservesExponentialClosed E.linearityConditionClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
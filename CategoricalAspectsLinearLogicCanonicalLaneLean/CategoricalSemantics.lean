import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure MonoidalCategoryStructure where
  tensorProduct : Type u → Type u → Type u
  unitObject : Type u
  associator : (A B C : Type u) → tensorProduct (tensorProduct A B) C ≅ tensorProduct A (tensorProduct B C)
  leftUnitor : (A : Type u) → tensorProduct unitObject A ≅ A
  rightUnitor : (A : Type u) → tensorProduct A unitObject ≅ A
  coherenceConditions : Prop

theorem monoidal_category_structure_coherence (M : MonoidalCategoryStructure) : M.coherenceConditions := by
  exact M.coherenceConditions

structure SymmetricMonoidalStructure extends MonoidalCategoryStructure where
  braiding : (A B : Type u) → tensorProduct A B ≅ tensorProduct B A
  hexagonCondition : Prop
  symmetryCondition : Prop
  hexagonConditionClosed : hexagonCondition
  symmetryConditionClosed : symmetryCondition

theorem symmetric_monoidal_structure_hexagon (S : SymmetricMonoidalStructure) : S.hexagonCondition := by
  exact S.hexagonConditionClosed

theorem symmetric_monoidal_structure_symmetry (S : SymmetricMonoidalStructure) : S.symmetryCondition := by
  exact S.symmetryConditionClosed

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
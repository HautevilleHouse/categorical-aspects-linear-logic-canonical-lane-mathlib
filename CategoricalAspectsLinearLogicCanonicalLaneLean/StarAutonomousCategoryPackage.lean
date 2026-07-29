import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure StarAutonomousCategoryPackage (M : MonoidalCategoryPackage) where
  dualObject : M.tensorProduct → Type u
  evaluationMorphism : Prop
  coevaluationMorphism : Prop
  dualityAxioms : Prop

structure StarAutonomousCategoryEvidence (M : MonoidalCategoryPackage)
    (S : StarAutonomousCategoryPackage M) where
  evaluationMorphismClosed : S.evaluationMorphism
  coevaluationMorphismClosed : S.coevaluationMorphism
  dualityAxiomsClosed : S.dualityAxioms

def StarAutonomousCategoryClosed (M : MonoidalCategoryPackage)
    (S : StarAutonomousCategoryPackage M) : Prop :=
  S.evaluationMorphism ∧ S.coevaluationMorphism ∧ S.dualityAxioms

theorem star_autonomous_category_closed_from_evidence
    (M : MonoidalCategoryPackage) (S : StarAutonomousCategoryPackage M)
    (E : StarAutonomousCategoryEvidence M S) : StarAutonomousCategoryClosed M S := by
  exact And.intro E.evaluationMorphismClosed
    (And.intro E.coevaluationMorphismClosed E.dualityAxiomsClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
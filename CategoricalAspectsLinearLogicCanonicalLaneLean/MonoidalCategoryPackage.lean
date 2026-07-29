import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure MonoidalCategoryPackage where
  tensorProduct : Type u
  unitObject : Type u
  associatorIsomorphism : Prop
  leftUnitorIsomorphism : Prop
  rightUnitorIsomorphism : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorIsomorphismClosed : M.associatorIsomorphism
  leftUnitorIsomorphismClosed : M.leftUnitorIsomorphism
  rightUnitorIsomorphismClosed : M.rightUnitorIsomorphism
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associatorIsomorphism ∧ M.leftUnitorIsomorphism ∧
  M.rightUnitorIsomorphism ∧ M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence
    (M : MonoidalCategoryPackage) (E : MonoidalCategoryEvidence M) :
    MonoidalCategoryClosed M := by
  exact And.intro E.associatorIsomorphismClosed
    (And.intro E.leftUnitorIsomorphismClosed
      (And.intro E.rightUnitorIsomorphismClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
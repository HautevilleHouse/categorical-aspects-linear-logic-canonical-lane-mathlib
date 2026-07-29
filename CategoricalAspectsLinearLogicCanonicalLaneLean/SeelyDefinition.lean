import CategoricalAspectsLinearLogicCanonicalLaneLean.AdmissibleClass

/-!
# Seely isomorphisms package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure SeelyIsomorphismPackage where
  monoidalCategory : Type u
  monoidalClosed : CategoryTheory.MonoidalClosed monoidalCategory
  exponential : Type v
  seelyIsoExists : Prop
  naturalInContext : Prop
  coherenceCondition : Prop

structure SeelyIsomorphismEvidence (S : SeelyIsomorphismPackage) where
  seelyIsoExistsClosed : S.seelyIsoExists
  naturalInContextClosed : S.naturalInContext
  coherenceConditionClosed : S.coherenceCondition

def SeelyIsomorphismClosed (S : SeelyIsomorphismPackage) : Prop :=
  S.seelyIsoExists ∧ S.naturalInContext ∧ S.coherenceCondition

theorem seely_isomorphism_closed_from_evidence
    (S : SeelyIsomorphismPackage) (E : SeelyIsomorphismEvidence S) :
    SeelyIsomorphismClosed S := by
  exact And.intro E.seelyIsoExistsClosed
    (And.intro E.naturalInContextClosed E.coherenceConditionClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
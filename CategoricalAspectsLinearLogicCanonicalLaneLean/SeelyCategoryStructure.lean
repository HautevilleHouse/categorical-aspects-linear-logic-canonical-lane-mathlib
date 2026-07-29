import CategoricalAspectsLinearLogicCanonicalLaneLean.Projection

/-!
# Seely Category Structure Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure SeelyCategoryPackage where
  category : Type u
  monoidalStructure : Prop
  comonoidStructure : Prop
  isomorphismsSeely : Prop
  categoricalModel : Prop

structure SeelyCategoryEvidence (S : SeelyCategoryPackage) where
  monoidalStructureClosed : S.monoidalStructure
  comonoidStructureClosed : S.comonoidStructure
  isomorphismsSeelyClosed : S.isomorphismsSeely
  categoricalModelClosed : S.categoricalModel

def SeelyCategoryClosed (S : SeelyCategoryPackage) : Prop :=
  S.monoidalStructure ∧ S.comonoidStructure ∧ S.isomorphismsSeely ∧ S.categoricalModel

theorem seely_category_closed_from_evidence
    (S : SeelyCategoryPackage) (E : SeelyCategoryEvidence S) :
    SeelyCategoryClosed S := by
  exact And.intro E.monoidalStructureClosed
    (And.intro E.comonoidStructureClosed
      (And.intro E.isomorphismsSeelyClosed E.categoricalModelClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

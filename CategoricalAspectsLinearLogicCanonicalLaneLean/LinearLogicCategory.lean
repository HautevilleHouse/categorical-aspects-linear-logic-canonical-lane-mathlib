import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearLogicCategory where
  obj : Type u
  hom : obj → obj → Type v
  id : ∀ X : obj, hom X X
  comp : ∀ {X Y Z : obj}, hom X Y → hom Y Z → hom X Z
  tensor : obj → obj → obj
  tensorUnit : obj
  tensorAssoc : Prop
  tensorUnitLeft : Prop
  tensorUnitRight : Prop
  tensorSym : Prop
  dual : obj → obj
  dualUnit : obj
  dualCounit : Prop
  dualUnitLeft : Prop
  dualUnitRight : Prop
  product : obj → obj → obj
  productUnit : obj
  productProj : Prop
  productInj : Prop
  coproduct : obj → obj → obj
  coproductUnit : obj
  coproductInj : Prop
  coproductProj : Prop

def LinearLogicCategoryClosed (C : LinearLogicCategory) : Prop :=
  C.tensorAssoc ∧ C.tensorUnitLeft ∧ C.tensorUnitRight ∧ C.tensorSym ∧
  C.dualCounit ∧ C.dualUnitLeft ∧ C.dualUnitRight ∧
  C.productProj ∧ C.productInj ∧ C.coproductInj ∧ C.coproductProj

structure LinearLogicCategoryEvidence (C : LinearLogicCategory) where
  tensorAssocClosed : C.tensorAssoc
  tensorUnitLeftClosed : C.tensorUnitLeft
  tensorUnitRightClosed : C.tensorUnitRight
  tensorSymClosed : C.tensorSym
  dualCounitClosed : C.dualCounit
  dualUnitLeftClosed : C.dualUnitLeft
  dualUnitRightClosed : C.dualUnitRight
  productProjClosed : C.productProj
  productInjClosed : C.productInj
  coproductInjClosed : C.coproductInj
  coproductProjClosed : C.coproductProj

theorem linear_logic_category_closed_from_evidence
    (C : LinearLogicCategory) (E : LinearLogicCategoryEvidence C) :
    LinearLogicCategoryClosed C := by
  refine And.intro E.tensorAssocClosed
    (And.intro E.tensorUnitLeftClosed
      (And.intro E.tensorUnitRightClosed
        (And.intro E.tensorSymClosed
          (And.intro E.dualCounitClosed
            (And.intro E.dualUnitLeftClosed
              (And.intro E.dualUnitRightClosed
                (And.intro E.productProjClosed
                  (And.intro E.productInjClosed
                    (And.intro E.coproductInjClosed E.coproductProjClosed))))))))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
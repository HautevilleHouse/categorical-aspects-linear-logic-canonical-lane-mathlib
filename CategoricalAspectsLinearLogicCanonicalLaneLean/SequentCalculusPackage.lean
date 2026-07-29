import CategoricalAspectsLinearLogicCanonicalLaneLean.LinearLogicCategoryPackage

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure SequentCalculusPackage {P : LinearLogicCategoryPackage} where
  formulas : Type u
  sequents : formulas → formulas → Prop
  tensorLeftRule : Prop
  tensorRightRule : Prop
  lollipopLeftRule : Prop
  lollipopRightRule : Prop
  cutRule : Prop

structure SequentCalculusEvidence {P : LinearLogicCategoryPackage}
    (S : SequentCalculusPackage P) where
  tensorLeftRuleClosed : S.tensorLeftRule
  tensorRightRuleClosed : S.tensorRightRule
  lollipopLeftRuleClosed : S.lollipopLeftRule
  lollipopRightRuleClosed : S.lollipopRightRule
  cutRuleClosed : S.cutRule

def SequentCalculusClosed {P : LinearLogicCategoryPackage}
    (S : SequentCalculusPackage P) : Prop :=
  S.tensorLeftRule ∧ S.tensorRightRule ∧
  S.lollipopLeftRule ∧ S.lollipopRightRule ∧
  S.cutRule

theorem sequent_calculus_closed_from_evidence {P : LinearLogicCategoryPackage}
    (S : SequentCalculusPackage P) (E : SequentCalculusEvidence S) :
    SequentCalculusClosed S :=
  And.intro E.tensorLeftRuleClosed
    (And.intro E.tensorRightRuleClosed
      (And.intro E.lollipopLeftRuleClosed
        (And.intro E.lollipopRightRuleClosed E.cutRuleClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

import CategoricalAspectsLinearLogicCanonicalLaneLean.SeelyDefinition

/-!
# Cut elimination package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure CutEliminationPackage where
  sequentCalculus : Type u
  cutRuleAdmissible : Prop
  substitutionProperty : Prop
  principalCutReduction : Prop
  commutingConversion : Prop

structure CutEliminationEvidence (C : CutEliminationPackage) where
  cutRuleAdmissibleClosed : C.cutRuleAdmissible
  substitutionPropertyClosed : C.substitutionProperty
  principalCutReductionClosed : C.principalCutReduction
  commutingConversionClosed : C.commutingConversion

def CutEliminationClosed (C : CutEliminationPackage) : Prop :=
  C.cutRuleAdmissible ∧ C.substitutionProperty ∧
  C.principalCutReduction ∧ C.commutingConversion

theorem cut_elimination_closed_from_evidence
    (C : CutEliminationPackage) (E : CutEliminationEvidence C) :
    CutEliminationClosed C := by
  exact And.intro E.cutRuleAdmissibleClosed
    (And.intro E.substitutionPropertyClosed
      (And.intro E.principalCutReductionClosed E.commutingConversionClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
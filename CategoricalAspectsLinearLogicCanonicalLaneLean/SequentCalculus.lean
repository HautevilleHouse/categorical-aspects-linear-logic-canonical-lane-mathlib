import canonicalLaneMathlib.SequentCalculus

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure SequentCalculusPackage where
  formulas : Type u
  contexts : Type v
  sequents : Type w
  structuralRules : Prop
  logicalRules : Prop
  cutAdmissible : Prop
  focusedNormalization : Prop

structure SequentCalculusEvidence (S : SequentCalculusPackage) where
  structuralRulesClosed : S.structuralRules
  logicalRulesClosed : S.logicalRules
  cutAdmissibleClosed : S.cutAdmissible
  focusedNormalizationClosed : S.focusedNormalization

def SequentCalculusClosed (S : SequentCalculusPackage) : Prop :=
  S.structuralRules ∧ S.logicalRules ∧ S.cutAdmissible ∧ S.focusedNormalization

theorem sequent_calculus_closed_from_evidence
    (S : SequentCalculusPackage) (E : SequentCalculusEvidence S) :
    SequentCalculusClosed S := by
  exact And.intro E.structuralRulesClosed
    (And.intro E.logicalRulesClosed
      (And.intro E.cutAdmissibleClosed E.focusedNormalizationClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
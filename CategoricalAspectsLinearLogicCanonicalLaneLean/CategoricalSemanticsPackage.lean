import CategoricalAspectsLinearLogicCanonicalLaneLean.SequentCalculusPackage

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure CategoricalSemanticsPackage {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} where
  formulaInterpretation : S.formulas → P.category
  tensorInterpretation : ∀ A B : S.formulas,
    formulaInterpretation (A ⊗ B) = P.tensorProduct (formulaInterpretation A) (formulaInterpretation B)
  lollipopInterpretation : ∀ A B : S.formulas,
    formulaInterpretation (A ⊸ B) = P.internalHom (formulaInterpretation A) (formulaInterpretation B)
  soundness : Prop

structure CategoricalSemanticsEvidence {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} (M : CategoricalSemanticsPackage P S) where
  tensorInterpretationClosed : ∀ A B : S.formulas,
    M.tensorInterpretation A B
  lollipopInterpretationClosed : ∀ A B : S.formulas,
    M.lollipopInterpretation A B
  soundnessClosed : M.soundness

def CategoricalSemanticsClosed {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} (M : CategoricalSemanticsPackage P S) : Prop :=
  (∀ A B : S.formulas, M.tensorInterpretation A B) ∧
  (∀ A B : S.formulas, M.lollipopInterpretation A B) ∧
  M.soundness

theorem categorical_semantics_closed_from_evidence {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} (M : CategoricalSemanticsPackage P S)
    (E : CategoricalSemanticsEvidence M) : CategoricalSemanticsClosed M :=
  And.intro (fun A B => E.tensorInterpretationClosed A B)
    (And.intro (fun A B => E.lollipopInterpretationClosed A B) E.soundnessClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalSemanticsPackage

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure CutEliminationPackage {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} {M : CategoricalSemanticsPackage P S} where
  cutReduction : Prop
  cutEliminationTheorem : Prop
  semanticsPreserved : Prop

structure CutEliminationEvidence {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} {M : CategoricalSemanticsPackage P S}
    (C : CutEliminationPackage P S M) where
  cutReductionClosed : C.cutReduction
  cutEliminationTheoremClosed : C.cutEliminationTheorem
  semanticsPreservedClosed : C.semanticsPreserved

def CutEliminationClosed {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} {M : CategoricalSemanticsPackage P S}
    (C : CutEliminationPackage P S M) : Prop :=
  C.cutReduction ∧ C.cutEliminationTheorem ∧ C.semanticsPreserved

theorem cut_elimination_closed_from_evidence {P : LinearLogicCategoryPackage}
    {S : SequentCalculusPackage P} {M : CategoricalSemanticsPackage P S}
    (C : CutEliminationPackage P S M) (E : CutEliminationEvidence C) :
    CutEliminationClosed C :=
  And.intro E.cutReductionClosed
    (And.intro E.cutEliminationTheoremClosed E.semanticsPreservedClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

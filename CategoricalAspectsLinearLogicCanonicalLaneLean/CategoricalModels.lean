import canonicalLaneMathlib.AdmissibleClass
import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalSemantics
import CategoricalAspectsLinearLogicCanonicalLaneLean.LinearLogicSequentCalculus

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure CategoricalModel (C : SymmetricMonoidalStructure) (S : SequentCalculusRules) where
  formulaAsObject : Type u → Type u
  proofAsMorphism : (A B : Type u) → (A ⊢ B) → (formulaAsObject A ⟶ formulaAsObject B)
  tensorCompatibility : (A B C D : Type u) (f : A ⊢ B) (g : C ⊢ D) →
    proofAsMorphism (tensor A C) (tensor B D) (S.tensorRule A B C D f g) =
    (proofAsMorphism A B f) ⊗ (proofAsMorphism C D g)
  parCompatibility : (A B C D : Type u) (f : A ⊢ B) (g : C ⊢ D) →
    proofAsMorphism (par A C) (par B D) (S.parRule A B C D f g) =
    (proofAsMorphism A B f) ⊕ (proofAsMorphism C D g)
  linearImplicationCompatibility : (A B C : Type u) (f : tensor A B ⊢ C) →
    proofAsMorphism A (linearImplication B C) (S.linearImplicationRule A B C f) =
    curry (proofAsMorphism (tensor A B) C f)
  bangCompatibility : (A B : Type u) (f : A ⊢ B) →
    proofAsMorphism (bang A) (bang B) (S.bangRule A B f) =
    bang (proofAsMorphism A B f)

structure CategoricalModelEvidence (C : SymmetricMonoidalStructure) (S : SequentCalculusRules) (M : CategoricalModel C S) where
  tensorCompatibilityClosed : M.tensorCompatibility
  parCompatibilityClosed : M.parCompatibility
  linearImplicationCompatibilityClosed : M.linearImplicationCompatibility
  bangCompatibilityClosed : M.bangCompatibility

def CategoricalModelClosed (C : SymmetricMonoidalStructure) (S : SequentCalculusRules) (M : CategoricalModel C S) : Prop :=
  M.tensorCompatibility ∧ M.parCompatibility ∧ M.linearImplicationCompatibility ∧ M.bangCompatibility

theorem categorical_model_closed_from_evidence (C : SymmetricMonoidalStructure) (S : SequentCalculusRules) (M : CategoricalModel C S) (E : CategoricalModelEvidence C S M) :
    CategoricalModelClosed C S M := by
  exact And.intro E.tensorCompatibilityClosed (And.intro E.parCompatibilityClosed (And.intro E.linearImplicationCompatibilityClosed E.bangCompatibilityClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
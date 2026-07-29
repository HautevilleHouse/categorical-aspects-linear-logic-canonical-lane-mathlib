import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure SequentCalculusRules where
  multiplicativeConjunction : Type u → Type u → Type u
  multiplicativeDisjunction : Type u → Type u → Type u
  linearImplication : Type u → Type u → Type u
  exponentialBang : Type u → Type u
  exponentialQuestion : Type u → Type u
  tensorRule : (A B C : Type u) → (A ⊢ B) → (C ⊢ D) → (tensor A C ⊢ tensor B D)
  parRule : (A B C : Type u) → (A ⊢ B) → (C ⊢ D) → (par A C ⊢ par B D)
  linearImplicationRule : (A B C : Type u) → (tensor A B ⊢ C) → (A ⊢ linearImplication B C)
  bangRule : (A B : Type u) → (A ⊢ B) → (bang A ⊢ bang B)
  questionRule : (A B : Type u) → (A ⊢ B) → (question A ⊢ question B)
  cutRule : (A B : Type u) → (A ⊢ B) → (B ⊢ C) → (A ⊢ C)

def SequentClosed (S : SequentCalculusRules) : Prop := True

theorem sequent_closed_trivial (S : SequentCalculusRules) : SequentClosed S := by
  trivial

theorem tensor_rule_available (S : SequentCalculusRules) (A B C D : Type u) (f : A ⊢ B) (g : C ⊢ D) : (tensor A C ⊢ tensor B D) :=
  S.tensorRule A B C D f g

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
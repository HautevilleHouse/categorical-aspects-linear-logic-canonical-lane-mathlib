import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure ProofNet where
  links : Type u
  axiomLinks : Prop
  tensorLinks : Prop
  parLinks : Prop
  cutLinks : Prop
  reductionRules : Prop
  correctnessCriterion : Prop

structure ProofNetEvidence (N : ProofNet) where
  axiomLinksClosed : N.axiomLinks
  tensorLinksClosed : N.tensorLinks
  parLinksClosed : N.parLinks
  cutLinksClosed : N.cutLinks
  reductionRulesClosed : N.reductionRules
  correctnessCriterionClosed : N.correctnessCriterion

def ProofNetClosed (N : ProofNet) : Prop :=
  N.axiomLinks ∧ N.tensorLinks ∧ N.parLinks ∧
  N.cutLinks ∧ N.reductionRules ∧ N.correctnessCriterion

theorem proof_net_closed_from_evidence (N : ProofNet)
    (E : ProofNetEvidence N) : ProofNetClosed N := by
  exact And.intro E.axiomLinksClosed
    (And.intro E.tensorLinksClosed
      (And.intro E.parLinksClosed
        (And.intro E.cutLinksClosed
          (And.intro E.reductionRulesClosed E.correctnessCriterionClosed))))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
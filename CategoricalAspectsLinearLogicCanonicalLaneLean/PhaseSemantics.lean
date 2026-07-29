import canonicalLaneMathlib.PhaseSemantics

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure PhaseSemanticsPackage where
  phaseSpace : Type u
  monoid : Type v
  phaseOp : Type w
  preordered : Prop
  idempotentCommuting : Prop
  dualizing : Prop
  completeness : Prop

structure PhaseSemanticsEvidence (P : PhaseSemanticsPackage) where
  preorderedClosed : P.preordered
  idempotentCommutingClosed : P.idempotentCommuting
  dualizingClosed : P.dualizing
  completenessClosed : P.completeness

def PhaseSemanticsClosed (P : PhaseSemanticsPackage) : Prop :=
  P.preordered ∧ P.idempotentCommuting ∧ P.dualizing ∧ P.completeness

theorem phase_semantics_closed_from_evidence
    (P : PhaseSemanticsPackage) (E : PhaseSemanticsEvidence P) :
    PhaseSemanticsClosed P := by
  exact And.intro E.preorderedClosed
    (And.intro E.idempotentCommutingClosed
      (And.intro E.dualizingClosed E.completenessClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
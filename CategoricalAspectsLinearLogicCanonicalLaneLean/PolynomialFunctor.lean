import CategoricalAspectsLinearLogicCanonicalLaneLean.SequentCalculus

/-!
# Polynomial Functor Model Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure PolynomialFunctorModel (S : StarAutonomousStructure) (C : SequentCalculusProofSystem S) where
  polyFunctor : Type → Type
  monadStructure : Prop
  strength : Prop
  traceOperation : Prop
  encodesProofs : Prop

structure PolynomialFunctorEvidence {S : StarAutonomousStructure} {C : SequentCalculusProofSystem S} (P : PolynomialFunctorModel S C) where
  monadStructureClosed : P.monadStructure
  strengthClosed : P.strength
  traceOperationClosed : P.traceOperation
  encodesProofsClosed : P.encodesProofs

def PolynomialFunctorClosed {S : StarAutonomousStructure} {C : SequentCalculusProofSystem S}
    (P : PolynomialFunctorModel S C) : Prop :=
  P.monadStructure ∧ P.strength ∧ P.traceOperation ∧ P.encodesProofs

theorem polynomial_functor_closed_from_evidence
    {S : StarAutonomousStructure} {C : SequentCalculusProofSystem S}
    (P : PolynomialFunctorModel S C) (E : PolynomialFunctorEvidence P) :
    PolynomialFunctorClosed P := by
  exact And.intro E.monadStructureClosed
    (And.intro E.strengthClosed
      (And.intro E.traceOperationClosed E.encodesProofsClosed))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

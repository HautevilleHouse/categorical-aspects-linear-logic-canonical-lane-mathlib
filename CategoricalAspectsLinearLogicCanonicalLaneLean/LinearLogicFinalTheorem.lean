import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalGateLemmas

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

def ConstrainedLinearLogicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_linear_logic_endgame (A : AdmissibleClass) :
    ConstrainedLinearLogicClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

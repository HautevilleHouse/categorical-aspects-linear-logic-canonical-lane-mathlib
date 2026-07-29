import canonicalLaneMathlib.AdmissibleClass
import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalSemantics
import CategoricalAspectsLinearLogicCanonicalLaneLean.LinearLogicSequentCalculus
import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalModels

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

def LinearLogicAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem linear_logic_admissible_endgame (A : AdmissibleClass) :
    LinearLogicAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem categorical_model_captures_linear_logic (C : SymmetricMonoidalStructure) (S : SequentCalculusRules) (M : CategoricalModel C S) (E : CategoricalModelEvidence C S M) :
    CategoricalModelClosed C S M := by
  exact categorical_model_closed_from_evidence C S M E

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
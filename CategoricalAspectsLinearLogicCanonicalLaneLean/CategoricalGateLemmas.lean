import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalBridgeLemmas

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

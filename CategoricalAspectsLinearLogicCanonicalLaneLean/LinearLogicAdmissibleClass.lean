import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalModels

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearLogicAdmissibleObject where
  carrier : Type u
  starAutonomous : Bool
  proofNetStructure : Bool
  conclusion : Bool

structure AdmissibleClass where
  object : LinearLogicAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LinearLogicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

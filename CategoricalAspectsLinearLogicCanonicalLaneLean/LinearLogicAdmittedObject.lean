import canonicalLaneMathlib.LinearLogicAdmittedObject

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearLogicSpace where
  carrier : Type
  categoryStructure : Type

structure LinearLogicAdmittedObject where
  space : LinearLogicSpace
  categoricalModel : Prop
  linearProofNet : Prop
  phaseModel : Prop
  conclusion : categoricalModel ∧ linearProofNet ∧ phaseModel

def LinearLogicWitnessClosed (O : LinearLogicAdmittedObject) : Prop :=
  O.categoricalModel ∧ O.linearProofNet ∧ O.phaseModel

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
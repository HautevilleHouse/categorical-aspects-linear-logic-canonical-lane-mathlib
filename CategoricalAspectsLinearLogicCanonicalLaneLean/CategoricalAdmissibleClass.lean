import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearLogicAdmittedObject where
  category : Type u
  monoidalStructure : Prop
  closedStructure : Prop
  linearExponential : Prop
  conclusion : monoidalStructure ∧ closedStructure ∧ linearExponential

def linearLogicWitnessClosed (O : LinearLogicAdmittedObject) : Prop :=
  O.conclusion

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

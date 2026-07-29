import CategoricalAspectsLinearLogicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def linearProjection : Projection LinearEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem linear_projection_idempotent (x : LinearEndgameState) :
    linearProjection.toFun (linearProjection.toFun x) = linearProjection.toFun x := by
  exact linearProjection.idempotent x

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

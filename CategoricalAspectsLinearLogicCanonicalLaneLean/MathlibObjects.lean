import CategoricalAspectsLinearLogicCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LinearSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LinearAdmittedObject where
  space : LinearSpace
  symmetricMonoidal : Prop
  closedStructure : Prop
  starAutonomous : Prop
  linearNexus : Type
  linearNexusTopology : TopologicalSpace linearNexus
  categoricalDuality : Prop
  conclusion : categoricalDuality

structure LinearEndgameState where
  object : LinearAdmittedObject

def LinearWitnessClosed (O : LinearAdmittedObject) : Prop :=
  O.categoricalDuality

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

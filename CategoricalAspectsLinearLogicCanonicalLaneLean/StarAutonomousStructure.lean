import CategoricalAspectsLinearLogicCanonicalLaneLean.DifferentialLinearLogic

/-!
# Star Autonomus Structure Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure StarAutonomousPackage {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} (dd : D) where
  dualizingObject : Type u
  dualFunctor : Type v
  closure : Prop
  internalHom : Prop
  dualityTheorem : Prop

structure StarAutonomousEvidence {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    (SA : StarAutonomousPackage dd) where
  closureClosed : SA.closure
  internalHomClosed : SA.internalHom
  dualityTheoremClosed : SA.dualityTheorem

def StarAutonomousClosed {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    (SA : StarAutonomousPackage dd) : Prop :=
  SA.closure ∧ SA.internalHom ∧ SA.dualityTheorem

theorem star_autonomous_closed_from_evidence
    {S : SeelyCategoryPackage} {s : S} {D : DifferentialLinearLogicPackage s} {dd : D}
    (SA : StarAutonomousPackage dd) (E : StarAutonomousEvidence SA) :
    StarAutonomousClosed SA := by
  exact And.intro E.closureClosed
    (And.intro E.internalHomClosed E.dualityTheoremClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

import CategoricalAspectsLinearLogicCanonicalLaneLean.QuantaleStructures

/-!
# Game Semantics Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure GameSemanticsPackage {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    {Q : QuantalePackage sa} (q : Q) where
  arena : Prop
  strategy : Prop
  innocence : Prop
  composition : Prop
  fullAbstraction : Prop

structure GameSemanticsEvidence {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    {Q : QuantalePackage sa} {q : Q}
    (G : GameSemanticsPackage q) where
  arenaClosed : G.arena
  strategyClosed : G.strategy
  innocenceClosed : G.innocence
  compositionClosed : G.composition
  fullAbstractionClosed : G.fullAbstraction

def GameSemanticsClosed {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    {Q : QuantalePackage sa} {q : Q}
    (G : GameSemanticsPackage q) : Prop :=
  G.arena ∧ G.strategy ∧ G.innocence ∧ G.composition ∧ G.fullAbstraction

theorem game_semantics_closed_from_evidence
    {S : SeelyCategoryPackage} {s : S} {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA} {Q : QuantalePackage sa} {q : Q}
    (G : GameSemanticsPackage q) (E : GameSemanticsEvidence G) :
    GameSemanticsClosed G := by
  exact And.intro E.arenaClosed
    (And.intro E.strategyClosed
      (And.intro E.innocenceClosed
        (And.intro E.compositionClosed E.fullAbstractionClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

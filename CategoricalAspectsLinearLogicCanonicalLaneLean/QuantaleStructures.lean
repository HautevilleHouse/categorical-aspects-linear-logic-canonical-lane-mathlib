import CategoricalAspectsLinearLogicCanonicalLaneLean.StarAutonomousStructure

/-!
# Quantale Structures Package
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure QuantalePackage {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} (sa : SA) where
  quantale : Prop
  involutiveResiduated : Prop
  phaseSemantics : Prop
  completeness : Prop
  categoricalEmbedding : Prop

structure QuantaleEvidence {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    (Q : QuantalePackage sa) where
  quantaleClosed : Q.quantale
  involutiveResiduatedClosed : Q.involutiveResiduated
  phaseSemanticsClosed : Q.phaseSemantics
  completenessClosed : Q.completeness
  categoricalEmbeddingClosed : Q.categoricalEmbedding

def QuantaleClosed {S : SeelyCategoryPackage} {s : S}
    {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    (Q : QuantalePackage sa) : Prop :=
  Q.quantale ∧ Q.involutiveResiduated ∧ Q.phaseSemantics ∧
  Q.completeness ∧ Q.categoricalEmbedding

theorem quantale_closed_from_evidence
    {S : SeelyCategoryPackage} {s : S} {D : DifferentialLinearLogicPackage s} {dd : D}
    {SA : StarAutonomousPackage dd} {sa : SA}
    (Q : QuantalePackage sa) (E : QuantaleEvidence Q) :
    QuantaleClosed Q := by
  exact And.intro E.quantaleClosed
    (And.intro E.involutiveResiduatedClosed
      (And.intro E.phaseSemanticsClosed
        (And.intro E.completenessClosed E.categoricalEmbeddingClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

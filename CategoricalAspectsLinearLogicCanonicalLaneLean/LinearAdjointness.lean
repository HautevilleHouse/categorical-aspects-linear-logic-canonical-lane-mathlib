import CategoricalAspectsLinearLogicCanonicalLaneLean.DoubleNegation

/-!
# Linear adjointness package (tensor-hom adjunction)
-/

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure LinearAdjointnessPackage where
  category : Type u
  monoidalClosed : CategoryTheory.MonoidalClosed category
  tensorObject : Type v
  internalHom : Type w
  adjunctionIso : Prop
  unitCounit : Prop
  coherence : Prop

structure LinearAdjointnessEvidence (L : LinearAdjointnessPackage) where
  adjunctionIsoClosed : L.adjunctionIso
  unitCounitClosed : L.unitCounit
  coherenceClosed : L.coherence

def LinearAdjointnessClosed (L : LinearAdjointnessPackage) : Prop :=
  L.adjunctionIso ∧ L.unitCounit ∧ L.coherence

theorem linear_adjointness_closed_from_evidence
    (L : LinearAdjointnessPackage) (E : LinearAdjointnessEvidence L) :
    LinearAdjointnessClosed L := by
  exact And.intro E.adjunctionIsoClosed
    (And.intro E.unitCounitClosed E.coherenceClosed)

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
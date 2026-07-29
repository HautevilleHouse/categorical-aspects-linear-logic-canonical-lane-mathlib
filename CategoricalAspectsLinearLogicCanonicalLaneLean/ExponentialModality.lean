import canonicalLaneMathlib.ExponentialModality

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

structure ExponentialModalityPackage where
  comonad : Type u
  monad : Type v
  bialgebra : Type w
  storage : Prop
  digging : Prop
  dereliction : Prop
  weakeningContraction : Prop
  seelyIso : Prop

structure ExponentialModalityEvidence (E : ExponentialModalityPackage) where
  storageClosed : E.storage
  diggingClosed : E.digging
  derelictionClosed : E.dereliction
  weakeningContractionClosed : E.weakeningContraction
  seelyIsoClosed : E.seelyIso

def ExponentialModalityClosed (E : ExponentialModalityPackage) : Prop :=
  E.storage ∧ E.digging ∧ E.dereliction ∧ E.weakeningContraction ∧ E.seelyIso

theorem exponential_modality_closed_from_evidence
    (E : ExponentialModalityPackage) (Ev : ExponentialModalityEvidence E) :
    ExponentialModalityClosed E := by
  exact And.intro Ev.storageClosed
    (And.intro Ev.diggingClosed
      (And.intro Ev.derelictionClosed
        (And.intro Ev.weakeningContractionClosed Ev.seelyIsoClosed)))

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
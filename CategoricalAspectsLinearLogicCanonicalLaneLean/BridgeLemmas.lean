import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LinearLogicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse
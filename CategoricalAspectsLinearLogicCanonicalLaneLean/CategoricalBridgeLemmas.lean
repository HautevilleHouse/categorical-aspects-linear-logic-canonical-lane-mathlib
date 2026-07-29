import CategoricalAspectsLinearLogicCanonicalLaneLean.CategoricalAdmissibleClass

namespace HautevilleHouse
namespace CategoricalAspectsLinearLogicCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  linearLogicWitnessClosed (A.object)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end CategoricalAspectsLinearLogicCanonicalLaneLean
end HautevilleHouse

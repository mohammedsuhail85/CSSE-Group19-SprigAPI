package lk.sliit.csse.group19.springApi.SpringBackendAPI.repositories;

import lk.sliit.csse.group19.springApi.SpringBackendAPI.Model.AuthorizedEmployee;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Dev
 */
@Repository
public interface AuthorizedEmployeeRepository extends CrudRepository<AuthorizedEmployee, String> {

}

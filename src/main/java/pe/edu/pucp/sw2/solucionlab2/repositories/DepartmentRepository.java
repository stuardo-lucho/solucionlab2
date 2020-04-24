package pe.edu.pucp.sw2.solucionlab2.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pe.edu.pucp.sw2.solucionlab2.entities.Department;

import java.util.List;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Integer> {

    @Query(value = "select * from departments where department_short_name = ?1", nativeQuery = true)
    List<Department> obtenerDepartmentoPorDSN(String depaShortName);
}

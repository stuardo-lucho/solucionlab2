package pe.edu.pucp.sw2.solucionlab2.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.pucp.sw2.solucionlab2.entities.Department;

@Repository
public interface DepartmentRepository extends JpaRepository<Department,Integer> {
}

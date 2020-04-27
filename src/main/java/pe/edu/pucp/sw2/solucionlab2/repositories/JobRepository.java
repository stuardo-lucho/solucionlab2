package pe.edu.pucp.sw2.solucionlab2.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pe.edu.pucp.sw2.solucionlab2.entities.Job;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job,String> {

    @Query(value="select * from jobs where min_salary < ?1 and max_salary > ?1",nativeQuery=true)
    List<Job> buscarSalarioMinaMax(int salario);
}

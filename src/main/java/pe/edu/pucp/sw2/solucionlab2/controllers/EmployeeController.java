package pe.edu.pucp.sw2.solucionlab2.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pe.edu.pucp.sw2.solucionlab2.entities.Department;
import pe.edu.pucp.sw2.solucionlab2.entities.Employee;
import pe.edu.pucp.sw2.solucionlab2.repositories.DepartmentRepository;
import pe.edu.pucp.sw2.solucionlab2.repositories.EmployeeRepository;
import pe.edu.pucp.sw2.solucionlab2.repositories.JobRepository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    DepartmentRepository departmentRepository;

    @Autowired
    JobRepository jobRepository;

    @GetMapping(value = {"", "/list"})
    public String lista(Model model) {
        model.addAttribute("listaEmp", employeeRepository.findAll());
        model.addAttribute("listaJobs",jobRepository.findAll());
        model.addAttribute("listaDepa",departmentRepository.findAll());
        return "employee/lista";
    }

    @GetMapping("/new")
    public String nuevoForm(Model model) {
        model.addAttribute("listaJobs", jobRepository.findAll());
        model.addAttribute("listaJefes", employeeRepository.findAll());
        model.addAttribute("listaDepas", departmentRepository.findAll());
        return "employee/newForm";
    }

    @PostMapping("/save")
    public String guardar(Employee employee, RedirectAttributes attr,
                          @RequestParam(name = "fechaContrato", required = false) String fechaContrato) {

        if (employee.getEmployeeId() == null) {
            //nuevo Empleado
            List<Employee> listaEmpleados = employeeRepository.findAll();
            Employee ultimoEmp = listaEmpleados.get(listaEmpleados.size() - 1);
            String[] ultimoEmpIdArray = ultimoEmp.getEmployeeId().split("_");
            int ultimoEmpIdInt = Integer.parseInt(ultimoEmpIdArray[0]);
            int nuevoIdInt = ultimoEmpIdInt + 1;

            Optional<Department> optDep = departmentRepository.findById(employee.getDepartmentId());
            Department department = optDep.get();

            String nuevoId = nuevoIdInt + "_" + department.getDepartmentShortName();
            employee.setEmployeeId(nuevoId);

            employee.setHireDate(new Date());

            employeeRepository.save(employee);
            attr.addFlashAttribute("msg", "Empleado creado exitosamente");
            return "redirect:/employee";

        } else {
            //actualizo  "2020-04-24 01:57:41.0"
            try {
                employee.setHireDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(fechaContrato));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            employeeRepository.save(employee);
            attr.addFlashAttribute("msg", "Empleado actualizado exitosamente");
            return "redirect:/employee";
        }
    }

    @GetMapping("/edit")
    public String editarForm(@RequestParam("id") String employeeId, Model model, RedirectAttributes attr) {

        Optional<Employee> opt = employeeRepository.findById(employeeId);
        if (opt.isPresent()) {
            Employee e = opt.get();
            if (e.getManagerId() == null) {
                attr.addFlashAttribute("msg", "Esta acción no está soportada por el momento para Empleados sin jefe");
                return "redirect:/employee";
            } else {
                model.addAttribute("employee", e);
                model.addAttribute("listaJobs", jobRepository.findAll());
                model.addAttribute("listaJefes", employeeRepository.findAll());
                return "employee/editForm";
            }
        } else {
            return "redirect:/employee";
        }
    }

    @GetMapping("/delete")
    public String borrar(@RequestParam("id") String employeeId, RedirectAttributes attr) {
        employeeRepository.deleteById(employeeId);
        attr.addFlashAttribute("msg", "Empleado borrado exitosamente");
        return "redirect:/employee";

    }
}

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
import pe.edu.pucp.sw2.solucionlab2.entities.Job;
import pe.edu.pucp.sw2.solucionlab2.repositories.DepartmentRepository;
import pe.edu.pucp.sw2.solucionlab2.repositories.EmployeeRepository;
import pe.edu.pucp.sw2.solucionlab2.repositories.JobRepository;
import pe.edu.pucp.sw2.solucionlab2.repositories.LocationRepository;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentRepository departmentRepository;

    @Autowired
    LocationRepository locationRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @GetMapping(value = {"", "/list"})
    public String lista(Model model) {
        model.addAttribute("lista", departmentRepository.findAll());
        model.addAttribute("listaLocations",locationRepository.findAll());
        return "department/lista";
    }

    @GetMapping("/new")
    public String nuevoForm(Model model) {
        model.addAttribute("listalocation", locationRepository.findAll());
        model.addAttribute("listaEmplo", employeeRepository.findAll());
        return "department/newForm";
    }

    @PostMapping("/save")
    public String guardar(Department department,
                              RedirectAttributes attr) {

        if (department.getDepartmentId() == 0) {
            //nuevo depa
            List<Department> listaDepas = departmentRepository.obtenerDepartmentoPorDSN(department.getDepartmentShortName());
            if (!listaDepas.isEmpty()) {
                attr.addFlashAttribute("msg", "Ya existe el nombre corto: " + department.getDepartmentShortName());
                return "redirect:/department/new";
            } else {
                listaDepas = departmentRepository.findAll();
                Department lastDepa = listaDepas.get(listaDepas.size() - 1);
                int nuevoId = lastDepa.getDepartmentId() + 10;
                department.setDepartmentId(nuevoId);
                department.setDepartmentShortName(department.getDepartmentShortName().toUpperCase());
                departmentRepository.save(department);
                attr.addFlashAttribute("msg", "Departamento creado exitosamente");
                return "redirect:/department";
            }
        } else {
            //actualizo
            departmentRepository.save(department);
            attr.addFlashAttribute("msg", "Departamento actualizado exitosamente");
            return "redirect:/department";
        }
    }

    @GetMapping("/edit")
    public String editarForm(@RequestParam("id") int departmentId, Model model, RedirectAttributes attr) {
        Optional<Department> opt = departmentRepository.findById(departmentId);
        if (opt.isPresent()) {
            Department d = opt.get();
            if (d.getManagerId() == null) {
                attr.addFlashAttribute("msg", "Esta acción no está soportada por el momento para departamentos sin jefe");
                return "redirect:/department";
            } else {
                model.addAttribute("department", d);
                model.addAttribute("listalocation", locationRepository.findAll());
                model.addAttribute("listaEmplo", employeeRepository.findAll());
                return "department/editForm";
            }
        } else {
            return "redirect:/department";
        }
    }

    @GetMapping("/delete")
    public String borrar(@RequestParam("id") int departmentId, RedirectAttributes attr) {
        departmentRepository.deleteById(departmentId);
        attr.addFlashAttribute("msg", "Departamento borrado exitosamente");
        return "redirect:/department";

    }

}

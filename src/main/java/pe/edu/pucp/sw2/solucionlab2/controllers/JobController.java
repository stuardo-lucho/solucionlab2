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
import pe.edu.pucp.sw2.solucionlab2.repositories.JobRepository;

import java.util.Optional;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    JobRepository jobRepository;

    @Autowired
    DepartmentRepository departmentRepository;

    @GetMapping(value = {"", "/list"})
    public String lista(Model model) {
        model.addAttribute("lista", jobRepository.findAll());
        return "job/lista";
    }

    @GetMapping("/new")
    public String nuevoForm(Model model) {
        model.addAttribute("listaDepartment", departmentRepository.findAll());
        return "job/newForm";
    }

    @PostMapping("/save")
    public String guardarJobs(Job job,
                              @RequestParam(name = "departmentId",required = false) Integer departmentId,
                              @RequestParam(name = "shortName",required = false) String shortName,
                              RedirectAttributes attr) {

        if(job.getJobId() == null) {
            //nuevo trabajo
            Optional<Department> opt = departmentRepository.findById(departmentId);
            if (opt.isPresent()) {
                Department d = opt.get();
                String newId = d.getDepartmentShortName() + "_" + shortName.toUpperCase();
                Optional<Job> optJob = jobRepository.findById(newId);
                if (optJob.isPresent()) {
                    attr.addFlashAttribute("msg", "Ya existe un nombre corto para el departmento seleccionado");
                    return "redirect:/job/new";
                } else {
                    job.setJobId(newId);
                    jobRepository.save(job);
                    attr.addFlashAttribute("msg", "Trabajo creado exitosamente");
                    return "redirect:/job";
                }
            } else {
                return "redirect:/job";
            }
        }else{
            //actualizo
            jobRepository.save(job);
            attr.addFlashAttribute("msg", "Trabajo actualizado exitosamente");
            return "redirect:/job";
        }
    }

    @GetMapping("/edit")
    public String editarForm(@RequestParam("id") String jobId,
                             Model model){
        Optional<Job> opt = jobRepository.findById(jobId);
        if(opt.isPresent()){
            model.addAttribute("job",opt.get());
            return "job/editForm";
        }else{
            return "redirect:/job";
        }
    }

    @GetMapping("/delete")
    public String editarForm(@RequestParam("id") String jobId,
                             RedirectAttributes attr){
        jobRepository.deleteById(jobId);
        attr.addFlashAttribute("msg", "Trabajo borrado exitosamente");
        return "redirect:/job";

    }

}

package pe.edu.pucp.sw2.solucionlab2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("")
    public String index(){
        return "index";
    }
}

package DkDesignManagement.Controller;

import DkDesignManagement.Entity.Test;
import DkDesignManagement.Repository.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeControll {

	@Autowired
	TestDao dao;

//	@RequestMapping("/")
//	public ModelAndView Index() {
//		ModelAndView v = new ModelAndView("user/index");
//		v.addObject("mess", "Hello World");
//		return v;
//	}

	@GetMapping("/")
	public ModelAndView index() {
		ModelAndView v = new ModelAndView("Login");
		v.addObject("mess", dao.getAll());
		return v;
	}

	@GetMapping (value = { "detail/{id}"})
	public ModelAndView detail(@PathVariable("id") int id) {
		ModelAndView v = new ModelAndView("user/detail");
		v.addObject("mess", dao.getOne(id));
		return v;
	}

	@RequestMapping("/insert")
	public String submit(@ModelAttribute("test") Test t) {
//		dao.add(t);
		return "user/submit";
	}

	@RequestMapping(value = {"add/{idPath}"})
	public String insertForm(@PathVariable("idPath") String idPath, Model model) {
		//ModelAndView v = new ModelAndView("user/index");
		int a = Integer.parseInt(idPath);
		Test t = dao.getOne(a);
		model.addAttribute(t);
//		v.addObject("mess", dao.getOne(a));
		return "user/index";
	}

	@RequestMapping("add/updateForm")
	public String updateSubmit(@ModelAttribute("test") Test t) {
		dao.update(t);
		return "redirect:/";
	}

}

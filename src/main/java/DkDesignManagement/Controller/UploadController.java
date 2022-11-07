package DkDesignManagement.Controller;


import DkDesignManagement.Service.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Controller
public class UploadController {


    @Autowired
    CloudinaryService cloudinary;


    @RequestMapping(value = "/upload-image", method = RequestMethod.POST)
    public ModelAndView loadImage(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws ServletException, IOException {

        String url = cloudinary.uploadFile(file, "default","image");
        if (ObjectUtils.isEmpty(url)) {
            request.setAttribute("message", "upload fail ");

            return new ModelAndView("upload");
        }

        request.setAttribute("message", "upload successfully : " + url);

        return new ModelAndView("upload");
    }

    @RequestMapping(value = "/upload-file", method = RequestMethod.POST)
    public ModelAndView loadFile(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws ServletException, IOException {

        String url = cloudinary.uploadFile(file,"default" ,"file");
        if (ObjectUtils.isEmpty(url)) {
            request.setAttribute("message", "upload fail ");

            return new ModelAndView("upload");
        }

        request.setAttribute("message", "upload successfully : " + url);

        return new ModelAndView("upload");
    }

    @RequestMapping(value = "/upload-image", method = RequestMethod.GET)
    public ModelAndView loadHome() {
        return new ModelAndView("upload");
    }
}

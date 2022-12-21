package DkDesignManagement.Service;

import DkDesignManagement.Utils.FileUtils;
import com.cloudinary.Cloudinary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Service
public class CloudinaryService {


    private String CLOUDINARY_URL = "cloudinary://524284468348922:QjMfMl2ZXTM1kVmoFbopRKXEfqw@dgbzprb8l";

    public String uploadFile(MultipartFile file, String folder, String catalog) throws IOException {
        Cloudinary cloudinary = new Cloudinary(CLOUDINARY_URL);

        String name = generateFileName(file);
        Map uploadMap = cloudinary.uploader().upload(FileUtils.convertMultiPartToFile(file), com.cloudinary.utils.ObjectUtils.asMap("resource_type", "auto"
                , "public_id", "" + catalog + "/" + folder + "/" + name + ""));
        return uploadMap.get("url").toString();
    }

    private String generateFileName(MultipartFile multiPart) {
        return new Date().getTime() + "-" + multiPart.getOriginalFilename().replace(" ", "_");
    }


}

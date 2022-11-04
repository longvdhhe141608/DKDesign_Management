package DkDesignManagement.Service;

import DkDesignManagement.utils.FileUtils;
import com.cloudinary.Cloudinary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Service
public class CloudinaryService {


    private String CLOUDINARY_URL = "cloudinary://691885891388263:j-_-LRNnuyALJTzAE_Ba9MP9ha0@demo-java-cloud-image";

    public String uploadFile(MultipartFile file, String folder) throws IOException {
        Cloudinary cloudinary = new Cloudinary(CLOUDINARY_URL);
        String name = generateFileName(file);
        Map uploadMap = cloudinary.uploader().upload(FileUtils.convertMultiPartToFile(file), com.cloudinary.utils.ObjectUtils.asMap("public_id", "image/image_" + folder + "/" + name + ""));

        return uploadMap.get("url").toString();

    }

    private String generateFileName(MultipartFile multiPart) {
        return new Date().getTime() + "-" + multiPart.getOriginalFilename().replace(" ", "_");
    }

}

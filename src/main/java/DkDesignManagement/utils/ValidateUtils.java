package DkDesignManagement.utils;


import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.w3c.dom.*;

import java.text.Normalizer;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import static org.springframework.beans.MethodInvocationException.ERROR_CODE;

public class ValidateUtils {
    public static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("").replace('đ', 'd').replace('Đ', 'D');

    }

    public static String generateEmployeeCode(String name) {
        StringTokenizer stringTokenizer = new StringTokenizer(name);
        StringBuilder code = new StringBuilder();
        while (stringTokenizer.hasMoreTokens()) {
            String temp = stringTokenizer.nextToken();
            if (stringTokenizer.hasMoreTokens()) {
                code.append(temp.charAt(0));
            } else {
                code.insert(0, temp);
            }
        }
        return code.toString();
    }



    public static void main(String[] args) {
        String name = "Vũ Nhất Nam";
        name = generateEmployeeCode(removeAccent(name.toLowerCase()));

        System.out.println("tk: "+name);
        String pass ="";
        System.out.println("mk: "+pass);
    }
}

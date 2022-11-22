package DkDesignManagement.utils;


import org.apache.commons.lang3.RandomStringUtils;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.w3c.dom.*;

import java.text.Normalizer;
import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

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

    public static String generateCommonLangPassword() {
        String upperCaseLetters = RandomStringUtils.random(2, 65, 90, true, true);
        String lowerCaseLetters = RandomStringUtils.random(2, 97, 122, true, true);
        String numbers = RandomStringUtils.randomNumeric(2);
        String specialChar = RandomStringUtils.random(2, 33, 47, false, false);
        String totalChars = RandomStringUtils.randomAlphanumeric(2);
        String combinedChars = upperCaseLetters.concat(lowerCaseLetters)
                .concat(numbers)
                .concat(specialChar)
                .concat(totalChars);
        List<Character> pwdChars = combinedChars.chars()
                .mapToObj(c -> (char) c)
                .collect(Collectors.toList());
        Collections.shuffle(pwdChars);
        String password = pwdChars.stream()
                .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
                .toString();
        return password;
    }

    public static void main(String[] args) {
        String name = "Vũ Nhất Nam";
        name = generateEmployeeCode(removeAccent(name.toLowerCase()));

        System.out.println("tk: "+name);
        String pass = generateCommonLangPassword();
        System.out.println("mk: "+pass);
    }
}

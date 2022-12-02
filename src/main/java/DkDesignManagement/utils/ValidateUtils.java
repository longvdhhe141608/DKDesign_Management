package DkDesignManagement.utils;


import DkDesignManagement.Entity.Account;
import org.apache.commons.lang3.RandomStringUtils;

import java.text.Normalizer;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class ValidateUtils {
    public static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("").replace('đ', 'd').replace('Đ', 'D');

    }

    public static String generateEmployeeCode(String name, List<String> userList) {
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
        String preCode = code.toString();
        int postNumber = 1;
        String usernameBuilder = preCode + postNumber;
        while (userList.contains(userList)) {
            postNumber++;
            usernameBuilder = preCode + postNumber;
        }
        return usernameBuilder;
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
        password.replace("'","$");
        return password;
    }

}

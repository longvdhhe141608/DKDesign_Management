package DkDesignManagement.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DateUtils {

   private static Logger logger = Logger.getLogger(DateUtils.class.getName());

    public static Date covertStringToDate(String dateString){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            // String -> Date
            date = format.parse(dateString);
        } catch (Exception e) {
            logger.log(Level.SEVERE,"error date "+e);
        }

        return date;
    }
}

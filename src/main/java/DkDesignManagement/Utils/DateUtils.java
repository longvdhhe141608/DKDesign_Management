package DkDesignManagement.Utils;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DateUtils {

    private static Logger logger = Logger.getLogger(DateUtils.class.getName());

    public static Date covertStringToDate(String dateString) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            // String -> Date
            date = format.parse(dateString);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "error date " + e);
        }

        return date;
    }

    public static final List<Long> times = Arrays.asList(
            TimeUnit.DAYS.toMillis(365),
            TimeUnit.DAYS.toMillis(30),
            TimeUnit.DAYS.toMillis(1),
            TimeUnit.HOURS.toMillis(1),
            TimeUnit.MINUTES.toMillis(1),
            TimeUnit.SECONDS.toMillis(1));
    public static final List<String> timesString = Arrays.asList("năm", "tháng", "ngày", "giờ", "phút", "giây");

    public static String toDuration(long duration) {
        StringBuffer res = new StringBuffer();
        for (int i = 0; i < times.size(); i++) {
            Long current = times.get(i);
            long temp = duration / current;
            if (temp > 0) {
                res.append(temp).append(" ").append(timesString.get(i)).append(temp != 1 ? "" : "").append(" trước");
                break;
            }
        }
        if ("".equals(res.toString()))
            return "0 giây trước";
        else
            return res.toString();
    }

    public static String getDateString(Date date) {
        String result = "";
        if (date != null) {
            Date dateNow = new Date();
            long difference = dateNow.getTime() - date.getTime();
            result = DateUtils.toDuration(difference);
            if (result.contains("tháng") || result.contains("năm")){
                result =date.toString();
            }
        }

        return result ;
    }


}

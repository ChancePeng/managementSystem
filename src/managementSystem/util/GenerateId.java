package managementSystem.util;



import java.util.Date;

public class GenerateId {
    public static String getId() {
        Date date = new Date();
        long time = date.getTime();
        String id = String.valueOf(time);
        System.out.println("当前时间为："+time);
        return id;
    }
}

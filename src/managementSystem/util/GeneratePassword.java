package managementSystem.util;

import java.util.Random;

public class GeneratePassword {
    public static String getPassword(){
        Random random = new Random();
        String password = "";
        String date = "abcdefghigklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        random.nextInt(9);
        for(int i=0;i<6;i++){
            int nextInt = random.nextInt(date.length());
            String str = date.substring(nextInt,nextInt+1);
            password = password.concat(str);
        }
        System.out.println(password);
        return password;
    }
}

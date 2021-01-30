
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;
import org.json.*;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;


public class Weather {

    final static String KEY = "9baf624691d9edbcf0ad5c31af8467ef";
    public static void main(String[] args){
        Scanner console = new Scanner(System.in);

        Boolean exit = false;

        while(!exit){
            System.out.print("current or forecast? ");
            String c = console.nextLine();
            System.out.print("Enter a city: ");
            String city = console.nextLine();
            if(c.equals("current")){
                currentWeather(city);
            }else{
                forecast(city);
            }


            System.out.print("Exit? ");
            String maybe = console.nextLine();
            if(maybe.toLowerCase().equals("yes")){exit = true;}

        }


    }
    public static JSONObject makeAPICall(String urlString){
        try {
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            String resultString = "";
            if(conn.getResponseCode() == 200){
                Scanner sc = new Scanner(url.openStream());
                while(sc.hasNext()){
                    resultString += sc.nextLine();
                }
                //System.out.println(resultString);
                //JSONParser parser = new JSONParser();
                return new JSONObject(resultString);
                //return (JSONObject) parser.parse(resultString);
            }

        }catch(IOException e){
            System.out.println(e);
        }
        return null;
    }

    public static void forecast(String city){
        //String call =
        String a = "";
        JSONObject alldata;
        city = city.replaceAll(" ", "%20");
        a = "http://api.openweathermap.org/data/2.5/forecast?q=" + city + "&units=imperial&appid="+ KEY;
        //System.out.println(a);
        alldata = makeAPICall(a);
        try {
            JSONArray days = alldata.getJSONArray("list");
            for(int i = 0; i < days.length(); i++) {
                System.out.println(days.getJSONObject(i).getString("dt_txt"));
                System.out.println(days.getJSONObject(i).getJSONArray("weather").getJSONObject(0).getString("description"));
            }
        }catch(JSONException | NullPointerException e){
            System.out.println(e);
        }
    }

    public static void currentWeather(String city){
        String a = "";
        JSONObject alldata;
        city = city.replaceAll(" ", "%20");
        a = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=imperial&appid="+ KEY;
        //System.out.println(a);
        alldata = makeAPICall(a);
        try {
            System.out.println(alldata.getJSONArray("weather").getJSONObject(0).getString("description"));
        }catch(JSONException | NullPointerException e){
            System.out.println(e);
        }
    }

}

package com.springstudy.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by zzh on 14-3-8.
 */
public class StaticPage {

    public static void main(String[] srg) throws IOException {
        String src = getStaticPage("http://www.cnblogs.com/fullhouse/archive/2012/01/17/2324842.html");
        File file = new File("d:\\aa.html");
        FileWriter resultFile = null;
        try {
            resultFile = new FileWriter(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        PrintWriter myFile = new PrintWriter(resultFile);
        //写文件
        myFile.println(src);
        resultFile.close();
        myFile.close();
    }

    private static String getStaticPage(String surl) {
        String htmlContent = "";
        try {
            java.io.InputStream inputStream;
            java.net.URL url = new java.net.URL(surl);
            java.net.HttpURLConnection connection = (java.net.HttpURLConnection) url.openConnection();
            connection.connect();
            inputStream = connection.getInputStream();
            byte bytes[] = new byte[1024 * 2000];
            int index = 0;
            int count = inputStream.read(bytes, index, 1024 * 2000);
            while (count != -1) {
                index += count;
                count = inputStream.read(bytes, index, 1);
            }
            htmlContent = new String(bytes, "UTF-8");
            connection.disconnect();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return htmlContent.trim();
    }

}

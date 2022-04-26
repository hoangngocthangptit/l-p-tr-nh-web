/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

/**
 *
 * @author nghie
 */
public class Hash {

    public String asciiToHex(String asciiStr) {
        char[] chars = asciiStr.toCharArray();
        StringBuilder hex = new StringBuilder();
        for (char ch : chars) {
            hex.append(Integer.toHexString((int) ch));
        }
        return hex.toString();
    }

    public String resetPasswordCode(int id) {
        long millis = System.currentTimeMillis();
        Date date = new Date(millis);
        System.out.println(date);
        SimpleDateFormat formatter = new SimpleDateFormat("ssyyyymmddMMHH");
        String s = new StringBuilder(formatter.format(date)).reverse().toString();
        return asciiToHex(id + s);
    }

    public String hexToAscii(String hexStr) {
        StringBuilder output = new StringBuilder("");
        for (int i = 0; i < hexStr.length(); i += 2) {
            String str = hexStr.substring(i, i + 2);
            output.append((char) Integer.parseInt(str, 16));
        }
        return output.toString();
    }

    public int revertResetPasswordCode(String rawcode) {
        String code = hexToAscii(rawcode);
        String id = code.substring(0, code.length() - 14);
        String date = new StringBuilder(code.substring(code.length() - 14)).reverse().toString();
        SimpleDateFormat formatter = new SimpleDateFormat("ssyyyymmddMMHH");
        try {
            long millis = System.currentTimeMillis();
            Date start = formatter.parse(date);
            Date end = new Date(millis);
            if (end.getTime() - start.getTime() - 30*60*1000 <= 0){
                return Integer.parseInt(id);
            }
        } catch (ParseException e) {
        }
        return 0;
    }
    
    public String HashPassword(String password){
        String code = asciiToHex(password);
        code = new StringBuilder(code).reverse().toString();
        code = asciiToHex(code);
        return code;
    }
    
    public String RevertPassword(String code){
        String password = hexToAscii(code);
        password = new StringBuilder(password).reverse().toString();
        password = hexToAscii(password);
        return password;
    } 

    public static void main(String[] args) {
        Hash hash = new Hash();
        System.out.println(hash.RevertPassword("36336135613633343333393732376236"));
        System.out.println(hash.HashPassword("8eNpG4DS"));
    }
}
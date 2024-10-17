package com.Tejas.ISP;

import java.security.SecureRandom;

public class ServiceCodeGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final int CODE_LENGTH = 8; // You can set the length of the service code here
    private static SecureRandom random = new SecureRandom();

    public static String generateServiceCode() {
        StringBuilder serviceCode = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            int index = random.nextInt(CHARACTERS.length());
            serviceCode.append(CHARACTERS.charAt(index));
        }
        return serviceCode.toString();
    }

//    public static void main(String[] args) {
//        String serviceCode = generateServiceCode();
//        System.out.println("Generated Service Code: " + serviceCode);
//    }
}

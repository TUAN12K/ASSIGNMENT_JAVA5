package com.example.assignment.util;

import java.util.Random;

public class GenMa {
    public static String generateRandomLineOfCode() {
        Random random = new Random();
        StringBuilder lineBuilder = new StringBuilder();

        int numTabs = random.nextInt(4) + 1;
        for (int i = 0; i < numTabs; i++) {
            lineBuilder.append("\t");
        }

        int lineLength = random.nextInt(30) + 1;
        for (int i = 0; i < lineLength; i++) {
            char randomChar = (char) (random.nextInt(26) + 'a');
            lineBuilder.append(randomChar);
        }

        return lineBuilder.toString();
    }
}

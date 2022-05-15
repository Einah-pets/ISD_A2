/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unit.test;

import org.junit.runner.JUnitCore;

import org.junit.runner.Result;

import org.junit.runner.notification.Failure;

/**
 *
 * @author Stephanie
 */
public class TestRunner {

    public static void main(String[] args) {
        System.out.println("- Testing Order: ");
        Result resultO = JUnitCore.runClasses(OrderTest.class);
        for (Failure failure : resultO.getFailures()) {
            System.out.println(failure.toString());

        }
        String statusO = resultO.wasSuccessful() ? "Passed" : "Failed";

        System.out.println(" Test status = " + statusO);

        System.out.println(" Number of Tests Passed = " + resultO.getRunCount());

        System.out.println(" Number of Tests Ignored = " + resultO.getIgnoreCount());

        System.out.println(" Number of Tests Failed = " + resultO.getFailureCount());

        System.out.println(" Time = " + resultO.getRunTime() / 1000.0 + "s");
        
        //orderline test
        System.out.println("- Testing Order: ");
        Result resultOL = JUnitCore.runClasses(OrderLineTest.class);
        for (Failure failure : resultOL.getFailures()) {
            System.out.println(failure.toString());

        }
        String statusOL = resultOL.wasSuccessful() ? "Passed" : "Failed";

        System.out.println(" Test status = " + statusOL);

        System.out.println(" Number of Tests Passed = " + resultOL.getRunCount());

        System.out.println(" Number of Tests Ignored = " + resultOL.getIgnoreCount());

        System.out.println(" Number of Tests Failed = " + resultOL.getFailureCount());

        System.out.println(" Time = " + resultOL.getRunTime() / 1000.0 + "s");

    }
}

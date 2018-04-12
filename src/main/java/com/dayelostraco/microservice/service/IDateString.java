/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import java.text.ParseException;
import java.util.Date;

/**
 *
 * @author leo
 */
public interface IDateString  {

    String addDays(String currentDateString, int day);

    String addDays(int day);

    /**
     *
     * @param currentDateString
     * @param year
     * @return
     */
    String addYears(String currentDateString, int year);

    String addYears(int year);

    boolean before(String date1, String date2);

    /**
     *
     * @param dataString
     * @return
     * @throws ParseException
     */
    int calcoloEta(String dataString) throws ParseException;

    /**
     *
     * @param date
     * @return
     */
    String dateToString(Date date);

    boolean isDateValid(String date);

    /**
     *
     * @return
     */
    String now();

    /**
     *
     * @param dt
     * @return
     * @throws ParseException
     */
    Date stringToDate(String dt) throws ParseException;
    
}

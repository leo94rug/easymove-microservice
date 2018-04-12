/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */
/**
 * java.util.date to java.sql.date
 */
@Service("dateService")

public class DatesConversion implements IDateString {

    static String pattern = "yyyy-MM-dd HH:mm:ss";

    /**
     *
     * @param dt
     * @return
     * @throws ParseException
     */
    @Override
    public java.util.Date stringToDate(String dt) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        java.util.Date date = null;
        date = simpleDateFormat.parse(dt);
        return date;
    }

    /**
     *
     * @param date
     * @return
     */
    @Override
    public String dateToString(java.util.Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        return formatter.format(date);
    }

    @Override
    public boolean before(String date1, String date2) {
        if(isDateValid(date1) && isDateValid(date2)){
            try {
                return stringToDate(date1).before(stringToDate(date2));
            } catch (ParseException ex) {
                return false;
            }
        }
        else{
            return false;
        }
    }

    @Override
    public boolean isDateValid(String date) {
        try {
            DateFormat df = new SimpleDateFormat(pattern);
            df.setLenient(false);
            df.parse(date);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     *
     * @return
     */
    @Override
    public String now() {
        return dateToString(new java.util.Date());
    }

    /**
     *
     * @param currentDateString
     * @param year
     * @return
     */
    @Override
    public String addYears(String currentDateString, int year) {
        DateTimeFormatter form = DateTimeFormatter.ofPattern(pattern);
        LocalDateTime dateTime = LocalDateTime.parse(currentDateString, form);
        dateTime = dateTime.plusYears(year);
        String yearsAfterString = dateTime.format(form);
        return yearsAfterString;
    }

    @Override
    public String addYears(int year) {
        return addYears(now(), year);
    }

    @Override
    public String addDays(String currentDateString, int day) {
        DateTimeFormatter form = DateTimeFormatter.ofPattern(pattern);
        LocalDateTime dateTime = LocalDateTime.parse(currentDateString, form);
        dateTime = dateTime.plusDays(day);
        String yearsAfterString = dateTime.format(form);
        return yearsAfterString;
    }

    @Override
    public String addDays(int day) {
        return addDays(now(), day);
    }

    /**
     *
     * @param dataString
     * @return
     * @throws ParseException
     */
    @Override
    public int calcoloEta(String dataString) throws ParseException {
        java.util.Date data = stringToDate(dataString);
        Calendar c = Calendar.getInstance();
        int anno = c.get(Calendar.YEAR);
        /* Ottieni l'anno */
        int mese = c.get(Calendar.MONTH);
        /* Ottieni il mese */
        int giorno = c.get(Calendar.DAY_OF_MONTH);
        /* Ottieni il giorno */
        GregorianCalendar gc = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
        GregorianCalendar today = new GregorianCalendar(TimeZone.getTimeZone("UTC"));
        gc.clear();
        gc.setTimeInMillis(data.getTime());
        gc.set(getYear(data), getMonth(data), getDay(data));
        today.set(anno, mese, giorno);
        double giorniFra = giorniFraDueDate(gc, today);
        return (int) (giorniFra / 365);
    }

    private static double giorniFraDueDate(GregorianCalendar dallaDataGC, GregorianCalendar allaDataGC) {
        return (allaDataGC.getTimeInMillis() - dallaDataGC.getTimeInMillis()) / 86400000;
    }

    private static int getDay(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.DAY_OF_MONTH);
    }

    private static int getMonth(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.MONTH);
    }

    private static int getYear(java.util.Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(Calendar.YEAR);
    }
}

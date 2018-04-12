package com.dayelostraco.microservice.controller;

import com.dayelostraco.microservice.model.exception.BadRequestException;
import com.dayelostraco.microservice.model.exception.ConflictException;
import com.dayelostraco.microservice.model.exception.NotConfirmedException;
import com.dayelostraco.microservice.model.exception.NotFoundException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(annotations = RestController.class)
public class ExceptionController {

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public void handle(Exception ex) {
        String e = ex.getMessage();
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NotFoundException.class)
    public void handle(NotFoundException ex) {
        String e = ex.getMessage();

    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BadRequestException.class)
    public void handle(BadRequestException ex) {
        String e = ex.getMessage();

    }    
    @ResponseStatus(HttpStatus.CONFLICT)
    @ExceptionHandler(ConflictException.class)
    public void handle(ConflictException ex) {
        String e = ex.getMessage();
    }    
        @ResponseStatus(HttpStatus.CONFLICT)
    @ExceptionHandler(NotConfirmedException.class)
    public void handle(NotConfirmedException ex) {
        String e = ex.getMessage();
    }

}

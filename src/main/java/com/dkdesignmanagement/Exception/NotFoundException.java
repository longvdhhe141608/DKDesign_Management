package com.dkdesignmanagement.Exception;

public class NotFoundException extends RuntimeException {
    public NotFoundException(String messege){
        super(messege);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import java.awt.Image;
import java.awt.image.BufferedImage;

/**
 *
 * @author leo
 */
public interface IImage{

    BufferedImage createResizedCopy(Image originalImage, int scaledWidth, int scaledHeight, boolean preserveAlpha);
    
}

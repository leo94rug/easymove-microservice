/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import com.dropbox.core.DbxException;
import com.dropbox.core.v2.files.DeleteResult;
import com.dropbox.core.v2.files.UploadErrorException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author leo
 */
public interface IStorage {

    /**
     * Uploads a file in chunks using multiple requests. This approach is
     * preferred for larger files since it allows for more efficient processing
     * of the file contents on the server side and also allows partial uploads
     * to be retried (e.g. network connection problem will not cause you to
     * re-upload all the bytes).
     *
     * @param localFile
     * @param dropboxPath Where to upload the file to within Dropbox
     */
    void chunkedUploadFile(File localFile, String dropboxPath);

    DeleteResult delete(String path) throws DbxException;

    String getFileUrl(String filename) throws DbxException;

    /**
     * Uploads a file in a single request. This approach is preferred for small
     * files since it eliminates unnecessary round-trips to the servers.
     *
     * @param localFile
     * @param dropboxPath Where to upload the file to within Dropbox
     */
    void uploadFile(File localFile, String dropboxPath);

    /**
     * Uploads a file in a single request. This approach is preferred for small
     * files since it eliminates unnecessary round-trips to the servers.
     *
     * @param in
     * @param dropboxPath Where to upload the file to within Dropbox
     * @throws com.dropbox.core.DbxException
     * @throws com.dropbox.core.v2.files.UploadErrorException
     * @throws java.io.IOException
     */
    void uploadStream(InputStream in, String dropboxPath) throws DbxException, UploadErrorException, IOException;
    
}

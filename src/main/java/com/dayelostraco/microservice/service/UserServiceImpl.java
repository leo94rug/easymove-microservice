/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.service;

import static com.dayelostraco.microservice.constants.Constants.defaultImagePath;
import static com.dayelostraco.microservice.constants.Constants.defaultProfileImage;
import static com.dayelostraco.microservice.constants.databaseConstants.Utente_tipologia.NON_CONFERMATO;
import com.dayelostraco.microservice.model.dto.UtenteDTO;
import com.dayelostraco.microservice.model.entity.Utente;
import com.dayelostraco.microservice.repository.UtenteRepository;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import javax.naming.NamingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 *
 * @author leo
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("dateService")
    IDateString dateString;
    @Autowired
    @Qualifier("encryptorService")
    ICrypt encryptorService;
    @Autowired
    UtenteRepository userRepository;
    //@Qualifier("utenteRepository")

    @Override
    public void deleteUser(String id){
        userRepository.removeById(id);
    }

    @Override
    public boolean existingUser(String email) throws InterruptedException, ExecutionException {
            Utente utente = userRepository.findByEmail(email);
            return utente != null;
    }

    @Override
    public Utente formalize(Utente utente) throws Exception {
        utente.setId(UUID.randomUUID().toString());
        utente.setFotoUtente(defaultProfileImage);
        utente.setImagePath(defaultImagePath);
        utente.setPsw(encryptorService.encrypt(utente.getPsw()));
        utente.setData(dateString.now());
        utente.setBiografia("L'utente non ha inserito una biografia");
        utente.setTipo(NON_CONFERMATO);
        return utente;
    }

    @Override
    public String getNomeCognome(String id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UtenteDTO getUtente(String id) throws SQLException, ParseException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Utente getUtenteByEmail(String email) throws InterruptedException, ExecutionException {
        return userRepository.findByEmail(email);
    }

    @Override
    public void insert(Utente utente) throws Exception{
        utente=formalize(utente);
        userRepository.save(utente);
    }

    @Override
    public int setPassword(String id, String psw) throws SQLException, Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateUser(Utente anagrafica, String id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateUserEmailStatus(String id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int updateUtenteImage(String id, String immagine, String path) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean userConfirm(String email) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

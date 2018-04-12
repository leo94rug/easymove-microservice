/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dayelostraco.microservice.controller;

import com.dayelostraco.microservice.constants.MediaType;
import static com.dayelostraco.microservice.constants.databaseConstants.Utente_tipologia.NON_CONFERMATO;
import static com.dayelostraco.microservice.constants.databaseConstants.Utente_tipologia.OSPITE;
import com.dayelostraco.microservice.mapper.IUtenteMapper;
import com.dayelostraco.microservice.model.dto.UtenteDTO;
import com.dayelostraco.microservice.model.entity.Utente;
import com.dayelostraco.microservice.model.exception.BadRequestException;
import com.dayelostraco.microservice.model.exception.ConflictException;
import com.dayelostraco.microservice.model.exception.NotConfirmedException;
import com.dayelostraco.microservice.model.exception.NotFoundException;
import com.dayelostraco.microservice.service.ICrypt;
import com.dayelostraco.microservice.service.IDateString;
import com.dayelostraco.microservice.service.IMsgFactory;
import com.dayelostraco.microservice.service.ISendEmail;
import com.dayelostraco.microservice.service.Ijwt;
import com.dayelostraco.microservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST Web Service
 *
 * @author leo
 */
@RestController
@RequestMapping(value = "/account")
public class AccountController {
//@Autowired
//UtenteJpaRepository ut;

    @Autowired
    @Qualifier("userService")
    UserService userService;
    @Autowired
    @Qualifier("dateService")
    IDateString dateString;
    @Autowired
    @Qualifier("simplecryptService")
    ICrypt simplecryptService;
    @Autowired
    @Qualifier("jwtService")
    Ijwt jwtService;
    @Autowired
    @Qualifier("encryptorService")
    ICrypt encryptorService;
    @Autowired
    @Qualifier("msgfactoryService")
    IMsgFactory msgfactoryService;    
    @Autowired
    @Qualifier("utenteMapper")
    IUtenteMapper utenteMapper;

    @RequestMapping(value = "/prova", method = RequestMethod.GET)
    public String login() {
        return dateString.now();
    }

    @RequestMapping(
            value = "/login",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.OK)
    public UtenteDTO login(@RequestBody Utente utente) throws Exception {
        String password = encryptorService.encrypt(utente.getPsw());
        Utente utenteRes = userService.getUtenteByEmail(utente.getEmail());
        if (utenteRes == null) {
            throw new NotFoundException();
        }
        if (utenteRes.getTipo() == NON_CONFERMATO) {
            throw new NotConfirmedException();
        }
        if (!utenteRes.getPsw().equals(password)) {
            throw new NotFoundException();
        }
        if (utenteRes.getTipo() == OSPITE) {
            throw new NotFoundException();
        }
        UtenteDTO utenteDTO = utenteMapper.getDTO(utenteRes);
        return utenteDTO;
    }

    @RequestMapping(
            value = "/confermaemail",
            method = RequestMethod.PUT,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.NO_CONTENT)

    public void confermaEmail(final String payload) {
//        try {
//
//            JSONObject obj = new JSONObject(payload);
//            String hash = obj.getString("hash");
//            String email = obj.getString("email");
//            if (simplecryptService.encrypt(email).equalsIgnoreCase(hash)) {
//                UtenteRes utenteRes = userRepository.getUtenteByEmail(email);
//                if (utenteRes == null) {
//                    return Response.status(Response.Status.NOT_FOUND).build();
//                }
//                if (utenteRes.getTipo() != NON_CONFERMATO) {
//                    return Response.status(498).build();
//                }
//
//                boolean result = userRepository.userConfirm(email);
//                if (result) {
//                } else {
//                    return Response.status(Response.Status.BAD_REQUEST).build();
//                }
//            } else {
//                return Response.status(Response.Status.BAD_REQUEST).build();
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
//            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build();
//        }
    }

    @RequestMapping(
            value = "/modificapsw",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.OK)

    public void modificaPassword(@RequestBody Utente payload) {
        try {
            int i = userRepository.setPassword(securityContext.getUserPrincipal().getName(), utente.getPassword());
                return Response.status(Response.Status.NOT_FOUND).build();

        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build(); //415
        }
    }

    @RequestMapping(
            value = "/register",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.CREATED)
    public void register(@RequestBody Utente utente) throws Exception {
        if (userService.existingUser(utente.getEmail())) {
            throw new ConflictException();
        }
        userService.insert(utente);
        ISendEmail msg = msgfactoryService.getBuildedEmail(IMsgFactory.type.ConfermaRegistrazione);
        msg.buildEmail(new String[]{utente.getEmail(), simplecryptService.encrypt(utente.getEmail())});
        msg.sendEmail(utente.getEmail());
    }

    @RequestMapping(
            value = "/resendemail",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.OK)
    public void resendEmail(final String email) throws Exception {
//            UtenteRes utenteRes = userRepository.getUtenteByEmail(email);
//            if (utenteRes == null) {
//                return Response.status(Response.Status.NOT_FOUND).build();
//            }
//            if (utenteRes.getTipo() != NON_CONFERMATO) {
//                return Response.status(498).build();
//            }
        ISendEmail msg = msgfactoryService.getBuildedEmail(IMsgFactory.type.ConfermaRegistrazione);
        msg.buildEmail(new String[]{email, simplecryptService.encrypt(email)});
        msg.sendEmail(email);

    }

    @RequestMapping(
            value = "/recuperapsw",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.OK)

    public void recuperopsw(final String payload) {
//        try  {
//            String new_psw = RandomStringUtils.randomAlphabetic(6);
//            Utente utente = userRepository.getUtenteByEmail(email);
//            if (utente != null) {
//                int i = userRepository.setPassword(utente.getId(), new_psw);
//                if (i == 0) {
//                    return Response.status(Response.Status.NOT_FOUND).build();
//                } else {
//                    ISendEmail msg = msgfactoryService.getBuildedEmail(IMsgFactory.type.CambiaPassword);
//                    msg.buildEmail(new String[]{new_psw});
//                    msg.sendEmail(email);
//                }
//            } else {
//                return Response.status(Response.Status.NOT_FOUND).build();
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
//            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).build(); //415
//        } catch (MessagingException ex) {
//            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
//            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Impossibile inviare l'email").build(); //415
//        } catch (Exception ex) {
//            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
//            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Non è stato possibile criptare il valore").build(); //415
//        }
    }

    @RequestMapping(
            value = "/\"check/{user1}/{user2}\"",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON)
    @ResponseStatus(HttpStatus.OK)

    public void updateEmailStatus(@PathVariable(value = "user1") final String user1, @PathVariable(value = "user2") final String user2) throws Exception {
        String encript = simplecryptService.encrypt(user1);
        if (encript.equalsIgnoreCase(user2)) {
            //userRepository.updateUserEmailStatus(user1);
        } else {
            throw new BadRequestException();
        }

    }

}

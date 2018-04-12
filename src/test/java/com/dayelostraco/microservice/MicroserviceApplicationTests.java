package com.dayelostraco.microservice;

import static com.dayelostraco.microservice.constants.Constants.defaultImagePath;
import static com.dayelostraco.microservice.constants.Constants.defaultProfileImage;
import com.dayelostraco.microservice.model.entity.Utente;
import com.dayelostraco.microservice.repository.UtenteRepository;
import com.dayelostraco.microservice.service.UserService;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletContext;
import static org.hamcrest.Matchers.hasSize;
import org.junit.Assert;
import static org.junit.Assert.assertNotNull;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.mock.http.MockHttpOutputMessage;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;
import org.springframework.test.context.ActiveProfiles;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
public class MicroserviceApplicationTests {

    private MediaType contentType = new MediaType(MediaType.APPLICATION_JSON.getType(),
            MediaType.APPLICATION_JSON.getSubtype(),
            Charset.forName("utf8"));

    private MockMvc mockMvc;

    private String userName = "leo94@gmail.com";

    private HttpMessageConverter mappingJackson2HttpMessageConverter;

    private Utente utente;

    private List<Utente> bookmarkList = new ArrayList<>();

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    @Qualifier("userService")
    UserService userService;
    @Autowired
    UtenteRepository utenteRepository;

    @Autowired
    void setConverters(HttpMessageConverter<?>[] converters) {

        this.mappingJackson2HttpMessageConverter = Arrays.asList(converters).stream()
                .filter(hmc -> hmc instanceof MappingJackson2HttpMessageConverter)
                .findAny()
                .orElse(null);

        assertNotNull("the JSON message converter must not be null",
                this.mappingJackson2HttpMessageConverter);
    }

    @Before
    public void setup() throws Exception {
        this.mockMvc = webAppContextSetup(webApplicationContext).build();

        this.utenteRepository.deleteAllInBatch();
        Utente utente1 = new Utente(
                "038bc079-db61-4c64-afcb-614cc49c0250", 
                "leo94rug@gmail.com", 
                "Leonardo", 
                "Ruggeri", 
                /*psw*/"XdFR/q/xyluDTnXzTV4WyQ==", 
                "bio", 
                1, 
                "2018-03-15 11:11:11", 
                "1994-03-15 11:11:11");
        this.utente = utenteRepository.save(utente1);
        utenteRepository.save(new Utente("id2-frrvr", "master_94@virgilio.it", "Ciro", "Ciro", "password", "bio", 2, "2018-03-15 11:11","1994-03-15 11:11"));
        utenteRepository.save(new Utente("id3-frrvr", "exist@prova.it", "Ciro", "Ciro", "password", "bio", 2, "2018-03-15 11:11","1994-03-15 11:11"));
        utenteRepository.save(new Utente("id4-frrvr", "notconfirmed@prova.it", "Ciro", "Ciro", "password", "bio", 3, "2018-03-15 11:11","1994-03-15 11:11"));
        utenteRepository.save(new Utente("id5-frrvr", "isospite@prova.it", "Ciro", "Ciro", "password", "bio", 0, "2018-03-15 11:11","1994-03-15 11:11"));
        utenteRepository.save(new Utente("id6-frrvr", "badpsw@prova.it", "Ciro", "Ciro", "password", "bio", 0, "2018-03-15 11:11","1994-03-15 11:11"));

    }

//    @Test
//    public void userNotFound() throws Exception {
//        mockMvc.perform(post("/george/bookmarks/")
//                .content(this.json(new Utente("id21-frrvr", "notfound@prova.it", "Ciro", "password", "bio", 1, "2018-03-15 11:11")))
//                .contentType(contentType))
//                .andExpect(status().isNotFound());
//    }
//
//    @Test
//    public void readSingleBookmark() throws Exception {
//        mockMvc.perform(get("/" + userName + "/bookmarks/"
//                + this.bookmarkList.get(0).getId()))
//                .andExpect(status().isOk())
//                .andExpect(content().contentType(contentType))
//                .andExpect(jsonPath("$.id", is(this.bookmarkList.get(0).getId().intValue())))
//                .andExpect(jsonPath("$.uri", is("http://bookmark.com/1/" + userName)))
//                .andExpect(jsonPath("$.description", is("A description")));
//    }
//
//    @Test
//    public void readBookmarks() throws Exception {
//        mockMvc.perform(get("/" + userName + "/bookmarks"))
//                .andExpect(status().isOk())
//                .andExpect(content().contentType(contentType))
//                .andExpect(jsonPath("$", hasSize(2)))
//                .andExpect(jsonPath("$[0].id", is(this.bookmarkList.get(0).getId().intValue())))
//                .andExpect(jsonPath("$[0].uri", is("http://bookmark.com/1/" + userName)))
//                .andExpect(jsonPath("$[0].description", is("A description")))
//                .andExpect(jsonPath("$[1].id", is(this.bookmarkList.get(1).getId().intValue())))
//                .andExpect(jsonPath("$[1].uri", is("http://bookmark.com/2/" + userName)))
//                .andExpect(jsonPath("$[1].description", is("A description")));
//    }
    @Test
    public void register() throws Exception {
        String utenteJson = json(new Utente("id-created", "created@prova.it", "Ciro", "Esposito", "password", "professione", "0324324", "bio", defaultProfileImage, defaultImagePath, "male", 1, "2018-03-15 11:11", "2000-03-15 11:11"));

        this.mockMvc.perform(post("/account/register")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isCreated());
    }

    @Test
    public void registerAlredyExist() throws Exception {
        String utenteJson = json(new Utente("id-alredyExist", "exist@prova.it", "Ciro", "Esposito", "password", "professione", "0324324", "bio", defaultProfileImage, defaultImagePath, "male", 1, "2018-03-15 11:11", "2000-03-15 11:11"));
        this.mockMvc.perform(post("/account/register")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isConflict());
    }

    @Test
    public void loginUserNotFound() throws Exception {
        String utenteJson = json(new Utente("notfound@prova.it", "secret"));
        this.mockMvc.perform(post("/account/login")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isNotFound());
    }

    @Test
    public void loginUserNotConfirmed() throws Exception {
        String utenteJson = json(new Utente("notconfirmed@prova.it", "secret"));
        this.mockMvc.perform(post("/account/login")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isConflict());
    }

    @Test
    public void loginUserIsOspite() throws Exception {
        String utenteJson = json(new Utente("isospite@prova.it", "secret"));
        this.mockMvc.perform(post("/account/login")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isNotFound());
    }

    @Test
    public void loginUserBadPsw() throws Exception {
        String utenteJson = json(new Utente("badpsw@prova.it", "badpsw"));
        this.mockMvc.perform(post("/account/login")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isNotFound());
    }

    @Test
    public void login() throws Exception {
        String utenteJson = json(new Utente("leo94rug@gmail.com", "secret"));
        this.mockMvc.perform(post("/account/login")
                .contentType(contentType)
                .content(utenteJson))
                .andExpect(status().isOk())
                .andExpect(content().contentType(contentType))
                .andExpect(jsonPath("$.id", is(this.utente.getId())))
                /*.andExpect(jsonPath("$.uri", is("http://bookmark.com/1/" + userName)))
                .andExpect(jsonPath("$.description", is("A description")))*/;
    }

    protected String json(Object o) throws IOException {
        MockHttpOutputMessage mockHttpOutputMessage = new MockHttpOutputMessage();
        this.mappingJackson2HttpMessageConverter.write(
                o, MediaType.APPLICATION_JSON, mockHttpOutputMessage);
        return mockHttpOutputMessage.getBodyAsString();
    }
}

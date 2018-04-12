package com.dayelostraco.microservice.repository;

import com.dayelostraco.microservice.model.entity.Utente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//@CacheConfig(cacheNames = "utente")
/*@RepositoryRestResource(
        collectionResourceRel = "sampleModel",
        path = "sampleModel",
        excerptProjection = SampleModelDto.class)*/
@Repository
public interface UtenteRepository extends JpaRepository<Utente, Long> {

    //@Async("threadPoolTaskExecutor")
    Utente findByEmail(String email);

    //@Async("threadPoolTaskExecutor")
    void removeById(String id);
}

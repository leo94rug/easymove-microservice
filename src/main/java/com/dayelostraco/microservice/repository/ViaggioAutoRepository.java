package com.dayelostraco.microservice.repository;

import com.dayelostraco.microservice.model.entity.ViaggioAuto;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@CacheConfig(cacheNames = "viaggioAuto")
/*@RepositoryRestResource(
        collectionResourceRel = "sampleModel",
        path = "sampleModel",
        excerptProjection = SampleModelDto.class)*/
public interface ViaggioAutoRepository extends JpaRepository<ViaggioAuto, Long> {

    /*@Override
    @CachePut("viaggioAuto")
    <S extends ViaggioAuto> S save(S s);*/

    @Override
    @Cacheable("viaggioAuto")
    ViaggioAuto findOne(Long aLong);
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import com.ruyicai.mgr.domain.Tactivities;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Tactivities_Roo_Entity {
    
    declare @type: Tactivities: @Entity;
    
    declare @type: Tactivities: @Table(name = "TACTIVITIES");
    
    @PersistenceContext(unitName = "persistenceUnit")
    transient EntityManager Tactivities.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Tactivities.id;
    
    public Long Tactivities.getId() {
        return this.id;
    }
    
    public void Tactivities.setId(Long id) {
        this.id = id;
    }
    
    @Transactional
    public void Tactivities.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Tactivities.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Tactivities attached = Tactivities.findTactivities(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Tactivities.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Tactivities.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Tactivities Tactivities.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tactivities merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Tactivities.entityManager() {
        EntityManager em = new Tactivities().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Tactivities.countTactivitieses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Tactivities o", Long.class).getSingleResult();
    }
    
    public static List<Tactivities> Tactivities.findAllTactivitieses() {
        return entityManager().createQuery("SELECT o FROM Tactivities o", Tactivities.class).getResultList();
    }
    
    public static Tactivities Tactivities.findTactivities(Long id) {
        if (id == null) return null;
        return entityManager().find(Tactivities.class, id);
    }
    
    public static List<Tactivities> Tactivities.findTactivitiesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Tactivities o", Tactivities.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}

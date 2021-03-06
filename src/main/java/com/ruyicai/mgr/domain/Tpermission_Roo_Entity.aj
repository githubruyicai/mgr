// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import com.ruyicai.mgr.domain.Tpermission;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Tpermission_Roo_Entity {
    
    declare @type: Tpermission: @Entity;
    
    declare @type: Tpermission: @Table(name = "TPERMISSION", schema = "JRTSCH");
    
    @PersistenceContext(unitName = "persistenceUnit")
    transient EntityManager Tpermission.entityManager;
    
    @Transactional
    public void Tpermission.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Tpermission.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Tpermission attached = Tpermission.findTpermission(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Tpermission.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Tpermission.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Tpermission Tpermission.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tpermission merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Tpermission.entityManager() {
        EntityManager em = new Tpermission().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Tpermission.countTpermissions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Tpermission o", Long.class).getSingleResult();
    }
    
    public static List<Tpermission> Tpermission.findAllTpermissions() {
        return entityManager().createQuery("SELECT o FROM Tpermission o", Tpermission.class).getResultList();
    }
    
    public static Tpermission Tpermission.findTpermission(BigDecimal id) {
        if (id == null) return null;
        return entityManager().find(Tpermission.class, id);
    }
    
    public static List<Tpermission> Tpermission.findTpermissionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Tpermission o", Tpermission.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import java.lang.Object;
import java.lang.String;
import javax.persistence.Embeddable;

privileged aspect TlotmapPK_Roo_Identifier {
    
    declare @type: TlotmapPK: @Embeddable;
    
    public TlotmapPK.new(String agencyno, String agencyflowno) {
        super();
        this.agencyno = agencyno;
        this.agencyflowno = agencyflowno;
    }

    private TlotmapPK.new() {
        super();
    }

    public boolean TlotmapPK.equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (!(obj instanceof TlotmapPK)) return false;
        TlotmapPK other = (TlotmapPK) obj;
        if (agencyno == null) {
            if (other.agencyno != null) return false;
        } else if (!agencyno.equals(other.agencyno)) return false;
        if (agencyflowno == null) {
            if (other.agencyflowno != null) return false;
        } else if (!agencyflowno.equals(other.agencyflowno)) return false;
        return true;
    }
    
    public int TlotmapPK.hashCode() {
        final int prime = 31;
        int result = 17;
        result = prime * result + (agencyno == null ? 0 : agencyno.hashCode());
        result = prime * result + (agencyflowno == null ? 0 : agencyflowno.hashCode());
        return result;
    }
    
}
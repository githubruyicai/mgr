// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import java.lang.String;

privileged aspect ServerDetail_Roo_ToString {
    
    public String ServerDetail.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Bz: ").append(getBz()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Jmx: ").append(getJmx()).append(", ");
        sb.append("Status: ").append(getStatus()).append(", ");
        sb.append("Url: ").append(getUrl());
        return sb.toString();
    }
    
}
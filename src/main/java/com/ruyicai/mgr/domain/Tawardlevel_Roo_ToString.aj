// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import java.lang.String;

privileged aspect Tawardlevel_Roo_ToString {
    
    public String Tawardlevel.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Addprize: ").append(getAddprize()).append(", ");
        sb.append("Id: ").append(getId()).append(", ");
        sb.append("Level: ").append(getLevel()).append(", ");
        sb.append("Levelprize: ").append(getLevelprize()).append(", ");
        sb.append("Lotno: ").append(getLotno()).append(", ");
        sb.append("Name: ").append(getName());
        return sb.toString();
    }
    
}
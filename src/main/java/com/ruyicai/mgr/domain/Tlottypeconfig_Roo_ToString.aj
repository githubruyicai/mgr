// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import java.lang.String;

privileged aspect Tlottypeconfig_Roo_ToString {
    
    public String Tlottypeconfig.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Autoencash: ").append(getAutoencash()).append(", ");
        sb.append("Betendtime: ").append(getBetendtime()).append(", ");
        sb.append("Hemaibetendtime: ").append(getHemaibetendtime()).append(", ");
        sb.append("Lotcenterisvalid: ").append(getLotcenterisvalid()).append(", ");
        sb.append("Lotno: ").append(getLotno()).append(", ");
        sb.append("Lvl: ").append(getLvl()).append(", ");
        sb.append("Name: ").append(getName()).append(", ");
        sb.append("Onprize: ").append(getOnprize()).append(", ");
        sb.append("State: ").append(getState());
        return sb.toString();
    }
    
}
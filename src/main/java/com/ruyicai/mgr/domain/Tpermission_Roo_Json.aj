// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import com.ruyicai.mgr.domain.Tpermission;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Tpermission_Roo_Json {
    
    public String Tpermission.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Tpermission Tpermission.fromJsonToTpermission(String json) {
        return new JSONDeserializer<Tpermission>().use(null, Tpermission.class).deserialize(json);
    }
    
    public static String Tpermission.toJsonArray(Collection<Tpermission> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Tpermission> Tpermission.fromJsonArrayToTpermissions(String json) {
        return new JSONDeserializer<List<Tpermission>>().use(null, ArrayList.class).use("values", Tpermission.class).deserialize(json);
    }
    
}

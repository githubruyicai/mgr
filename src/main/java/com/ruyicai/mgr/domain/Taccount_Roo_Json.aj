// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import com.ruyicai.mgr.domain.Taccount;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Taccount_Roo_Json {
    
    public String Taccount.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Taccount Taccount.fromJsonToTaccount(String json) {
        return new JSONDeserializer<Taccount>().use(null, Taccount.class).deserialize(json);
    }
    
    public static String Taccount.toJsonArray(Collection<Taccount> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Taccount> Taccount.fromJsonArrayToTaccounts(String json) {
        return new JSONDeserializer<List<Taccount>>().use(null, ArrayList.class).use("values", Taccount.class).deserialize(json);
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ruyicai.mgr.domain;

import com.ruyicai.mgr.domain.Tloguser;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Tloguser_Roo_Json {
    
    public String Tloguser.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Tloguser Tloguser.fromJsonToTloguser(String json) {
        return new JSONDeserializer<Tloguser>().use(null, Tloguser.class).deserialize(json);
    }
    
    public static String Tloguser.toJsonArray(Collection<Tloguser> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Tloguser> Tloguser.fromJsonArrayToTlogusers(String json) {
        return new JSONDeserializer<List<Tloguser>>().use(null, ArrayList.class).use("values", Tloguser.class).deserialize(json);
    }
    
}

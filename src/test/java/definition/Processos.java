package definition;

import groovy.json.internal.LazyMap;
import support.RESTSupport;

public class Processos {

    private static final String URL_processos = "http://agapito-server.herokuapp.com/processos/";
    public static LazyMap camposJson = new LazyMap();
    private static String UltimoUsuario;
    private static String id;

    public static void preencherCampo(String field, String value) {
        camposJson.put(field, value);
    }

    public static void limparCampos() {
        camposJson.clear();
    }
    public static LazyMap obterCampos() {
        return camposJson;
    }

    public static String obterEndPoint() {
        return URL_processos;
    }

    public static void setId(String pId) {
        id = pId;
    }

    public static String getId(){
        return id;
    }

    public static String recuperarCampo(String campo) {

        //return RESTSupport.key(campo).toString();
        return RESTSupport.key(campo).toString();
    }
}

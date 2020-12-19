package steps;

import cucumber.api.java.pt.*;
import definition.Processos;
import definition.Usuario;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

public class ProcessosSteps {
    @Dado("^O usuario esta na pagina de processos$")
    public void oUsuarioEstaNaPaginaDeProcessos() {
        Processos.limparCampos();
    }

    @E("^o usuário informar \"([^\"]*)\" com o valor igual a \"([^\"]*)\"$")
    public void oUsuárioInformarComOValorIgualA(String campo, String valor) throws Throwable {
        Processos.preencherCampo(campo,valor);
    }

    @Quando("^o usuário clicar no botão salvar$")
    public void oUsuárioClicarNoBotãoSalvar() throws Exception {
            RESTSupport.executePost(Processos.obterEndPoint(), Processos.obterCampos());
            Processos.setId(RESTSupport.key("id").toString());
    }

    @Dado("^que o usuário gostaria de obter processo por Id$")
    public void queOUsuárioGostariaDeObterProcessoPorId() throws Exception {
        oUsuárioClicarNoBotãoSalvar();
    }

    @Quando("^o usuário clicar no botão mostrar$")
    public void oUsuárioClicarNoBotãoMostrar() {
        RESTSupport.executeGet(Processos.obterEndPoint() + Processos.getId());
    }

    @Então("^o usuário deveria vizualizar o processo$")
    public void oUsuárioDeveriaVizualizarOCodigo() {
        String a = Processos.getId();
        Assert.assertEquals(200,RESTSupport.executeGet(Processos.obterEndPoint() + Processos.getId()).getStatusCode());
    }

    @Quando("^alterar o campo \"([^\"]*)\" para o valor \"([^\"]*)\"$")
    public void alterarOCampoParaOValor(String campo, String valor) throws Throwable {
        Processos.preencherCampo(campo,valor);
    }

    @E("^o usuario clicar em editar$")
    public void oUsuarioClicarEmEditar() throws InterruptedException {
        RESTSupport.executePut(Processos.obterEndPoint()  + Processos.getId(), Processos.obterCampos());
        Thread.sleep(2000);
    }

    @Quando("^o usuário clicar em mostrar$")
    public void oUsuárioClicarEmMostrar() {
        RESTSupport.executeGet(Usuario.obterEndPoint() + "/" + Processos.getId());
    }

    @Entao("^o usuario visualiza o campo \"([^\"]*)\" com o valor \"([^\"]*)\"$")
    public void oUsuarioVisualizaOCampoComOValor(String campo, String valor) throws Throwable {

        LazyMap proc = Processos.camposJson;

        String atual = Processos.recuperarCampo(campo);

        Assert.assertEquals(valor,atual);
    }

    @Quando("^o usuário clicar em deletar$")
    public void oUsuárioClicarEmDeletar() {
        RESTSupport.executeDelete(Processos.obterEndPoint() + '/' + Processos.getId());
    }

    @Então("^o usuário deveria ver a status \"([^\"]*)\"$")
    public void oUsuárioDeveriaVerAStatus(String valor) throws Throwable {
        Assert.assertEquals(valor,RESTSupport.getResponseCode().toString());
    }
}

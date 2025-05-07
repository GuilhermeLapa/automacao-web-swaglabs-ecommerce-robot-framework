import json as json
import jsonpath as jsonpath

class Utils():
    def __init__(self):
        self.caminhoUrlsJson= "../automacao-web-swaglabs-ecommerce-robot-framework/src/recursos/propriedades/urls.json";
        self.caminhoLocatorsJson= "../automacao-web-swaglabs-ecommerce-robot-framework/src/recursos/propriedades/locators.json";
        self.caminhoUsuariosJson= "../automacao-web-swaglabs-ecommerce-robot-framework/src/recursos/propriedades/usuarios.json";

    def Obter_Valor_Campo_Json(self, caminhoArquivoJson, jsonPath):
        with open(caminhoArquivoJson, 'r') as arquivoJson:
            dadosJson= json.load(arquivoJson);
        
        valorCampoJson= jsonpath.findall(jsonPath, dadosJson);
        return valorCampoJson;

    def Obter_Url(self, jsonPath):
        url= self.Obter_Valor_Campo_Json(self.caminhoUrlsJson, jsonPath);
        return url[0];

    def Obter_Locator(self, jsonPath):
        locator= self.Obter_Valor_Campo_Json(self.caminhoLocatorsJson, jsonPath);
        return locator[0];

    def Obter_Dados_Usuarios(self, jsonPath):
        dadoUsuario= self.Obter_Valor_Campo_Json(self.caminhoUsuariosJson, jsonPath);
        return dadoUsuario[0];

    def Obter_Lista_Locators(self, jsonPath):
        locator= self.Obter_Valor_Campo_Json(self.caminhoLocatorsJson, jsonPath);
        return locator;

    def Obter_Lista_Dados_Usuarios(self, jsonPath):
        dadoUsuario= self.Obter_Valor_Campo_Json(self.caminhoUsuariosJson, jsonPath);
        return dadoUsuario;

# u= Utils();
# a= u.Obter_Url("$.TelaLogin");
# print(a);
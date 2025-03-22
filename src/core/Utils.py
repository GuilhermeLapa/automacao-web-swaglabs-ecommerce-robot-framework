import json as json
import jsonpath as jsonpath

class Utils():
    def __init__(self):
        pass

    def Obter_Locator(self, caminhoLocatorsArquivoJson, jsonPath):
        with open(caminhoLocatorsArquivoJson, 'r') as arquivoJson:
            dadosJson= json.load(arquivoJson);
        
        locator= jsonpath.findall(jsonPath, dadosJson);
        return locator;

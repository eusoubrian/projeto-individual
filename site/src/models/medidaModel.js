var database = require("../database/config");

function buscarUltimasMedidas(limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select count(fkDecada) as voto, decada.nome from usuario
		join decada on usuario.fkDecada = decada.idDecada
        group by decada.nome 
		`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select count(fkDecada) as voto, decada.nome from usuario
		join decada on usuario.fkDecada = decada.idDecada
        group by decada.nome 
		`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal() {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select count(fkDecada) as voto, decada.nome from usuario
		join decada on usuario.fkDecada = decada.idDecada
        group by decada.nome 
		
        ;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select count(fkDecada) as voto, decada.nome from usuario
		join decada on usuario.fkDecada = decada.idDecada
        group by decada.nome 
		
        ;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}

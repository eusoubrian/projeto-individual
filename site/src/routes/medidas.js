var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/melhorDecada", function (req, res) {
    medidaController.buscarMelhorDecada(req, res);
})

router.get("/listarPontuacao/:idUsuario", function (req, res) {
    medidaController.listarPontuacao(req, res);
});


module.exports = router;
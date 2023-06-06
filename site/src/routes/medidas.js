var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/buscarPontuacao/:idAquario", function (req, res) {
    medidaController.buscarPontuacao(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/melhorDecada", function (req, res) {
    medidaController.buscarMelhorDecada(req, res);
})


module.exports = router;
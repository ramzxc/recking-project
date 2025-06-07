const express = require("express");
const router = express.Router();
const favoritesController = require("../controllers/favoritesController");

router.get("/:userId", favoritesController.getFavoritesByUser);
router.post("/", favoritesController.addFavorite);
router.delete("/", favoritesController.removeFavorite);

module.exports = router;

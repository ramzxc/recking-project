const express = require("express");
const router = express.Router();
const activitiesController = require("../controllers/activitiesController");

// GET /activities
router.get("/", activitiesController.getAllActivities);

// GET /activities/:id
router.get("/:id", activitiesController.getActivityById);

// POST /activities
router.post("/", activitiesController.createActivity);

// PUT /activities/:id
router.put("/:id", activitiesController.updateActivity);

// DELETE /activities/:id
router.delete("/:id", activitiesController.deleteActivity);

module.exports = router;

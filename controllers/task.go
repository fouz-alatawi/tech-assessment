package controllers

import (
	"net/http"
	"tech-assessment/initializers"
	"tech-assessment/models"

	"github.com/gin-gonic/gin"
)

func CreateTask(c *gin.Context) {
	// Define an input struct for binding
	var input struct {
		Title       string `form:"title"       json:"title"`
		Description string `form:"description" json:"description"`
		Priority    string `form:"priority"    json:"priority"`
		Status      string `form:"status"      json:"status"`
	}

	// Bind JSON to the input struct
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Get the user from the context
	user := c.MustGet("user").(models.User)

	// Create the task using the input values and set the UserID
	task := models.Task{
		Title:       input.Title,
		Description: input.Description,
		Priority:    input.Priority,
		Status:      input.Status,
		UserID:      user.ID,
	}

	// Save to database
	result := initializers.DB.Create(&task)
	if result.Error != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Failed to create task"})
		return
	}

	c.JSON(http.StatusOK, task)
}

func GetTasks(c *gin.Context) {
	var tasks []models.Task

	priority := c.Query("priority")
	status := c.Query("status")

	query := initializers.DB.Model(&models.Task{})

	if priority != "" {
		query = query.Where("priority = ?", priority)
	}

	if status != "" {
		query = query.Where("status = ?", status)
	}

	query.Find(&tasks)
	c.JSON(http.StatusOK, tasks)
}

func GetTaskByID(c *gin.Context) {
	id := c.Param("id")
	var task models.Task
	result := initializers.DB.Where("id = ?", id).First(&task)
	if result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Task not found"})
		return
	}

	c.JSON(http.StatusOK, task)
}

func UpdateTask(c *gin.Context) {

	// Retrieve the task ID from the URL parameter
	id := c.Param("id")

	var task models.Task
	result := initializers.DB.Where("id = ?", id).First(&task)

	if result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Task not found"})
		return
	}
	var input struct {
		Title       string `form:"title"       json:"title"`
		Description string `form:"description" json:"description"`
		Priority    string `form:"priority"    json:"priority"`
		Status      string `form:"status"      json:"status"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	task.Title = input.Title
	task.Description = input.Description
	task.Priority = input.Priority
	task.Status = input.Status

	initializers.DB.Save(&task)
	c.JSON(http.StatusOK, task)
}

func DeleteTask(c *gin.Context) {
	id := c.Param("id")

	var task models.Task
	result := initializers.DB.Where("id = ?", id).First(&task)
	if result.Error != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Task not found"})
		return
	}

	initializers.DB.Delete(&task)
	c.JSON(http.StatusOK, gin.H{"message": "Task deleted"})
}

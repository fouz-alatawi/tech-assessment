package routes

import (
	"tech-assessment/controllers"
	"tech-assessment/middleware"

	"github.com/gin-gonic/gin"
)

func InitializeRoutes(r *gin.Engine) {

	// Load HTML templates
	r.LoadHTMLGlob("views/*")

	// Auth Routes
	r.GET("/register", func(c *gin.Context) {
		c.HTML(200, "register.html", nil)
	})
	r.POST("/register", controllers.Register)

	r.GET("/login", func(c *gin.Context) {
		c.HTML(200, "login.html", nil)
	})
	r.POST("/login", controllers.Login)

	r.GET("/", func(c *gin.Context) {
		c.HTML(200, "index.html", nil)
	})

	r.GET("/tasks", middleware.RequireLogin, func(c *gin.Context) {
		c.HTML(200, "tasks.html", nil)
	})
	r.GET("/tasks/:id", middleware.RequireLogin, func(c *gin.Context) {
		c.HTML(200, "update.html", nil)
	})
	r.GET("/tasks/create", middleware.RequireLogin, func(c *gin.Context) {
		c.HTML(200, "create.html", nil)
	})

	// Task API Routes
	taskRoutes := r.Group("/api/tasks")
	taskRoutes.Use(middleware.Authenticate)
	{
		taskRoutes.GET("/", controllers.GetTasks)
		taskRoutes.POST("/", controllers.CreateTask)
		taskRoutes.GET("/:id", controllers.GetTaskByID)
		taskRoutes.PUT("/:id", controllers.UpdateTask)
		taskRoutes.DELETE("/:id", controllers.DeleteTask)
	}
}

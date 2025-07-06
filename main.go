package main

import (
	"tech-assessment/initializers"
	"tech-assessment/routes"

	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnv()
	initializers.ConnectDB()
	initializers.MigrateDB()
}

func main() {
	r := gin.Default()
	routes.InitializeRoutes(r)
	r.Run()
}

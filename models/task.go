package models

import "gorm.io/gorm"

type Task struct {
	gorm.Model         // includes: ID, created_at, updated_at, deleted_at
	UserID      uint   `json:"-"`
	Title       string `json:"title" binding:"required"`
	Description string `json:"description"`
	Priority    string `json:"priority" binding:"omitempty,oneof=low medium high"`
	Status      string `json:"status" binding:"omitempty,oneof=pending in-progress completed"`
}

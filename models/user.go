package models

import "gorm.io/gorm"

type User struct {
	gorm.Model        // includes: ID, created_at, updated_at, deleted_at
	Email      string `gorm:"unique" validate:"email"`
	Username   string `validate:"required,min=6"`
	Password   string `validate:"required,min=6"`
}

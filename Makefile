# # Makefile
# .PHONY: install-backend install-frontend install-all start-backend start-frontend start-all

# install-backend:
# 	cd backend && npm i --s --f 

# install-frontend:
# 	cd frontend && npm i --s --f 

# install-all: install-backend install-frontend

# start-backend:
# 	cd backend && npm start

# start-frontend:
# 	cd frontend && npm start

# start-all:
# 	make -j2 start-backend start-frontend



.PHONY: install-backend install-frontend install-all start-backend start-frontend start-all check-db-linux check-db-windows

# Check for the platform
OS := $(shell uname)

install-backend:
	cd backend && npm i --s --f 

install-frontend:
	cd frontend && npm i --s --f 

install-all: install-backend install-frontend

start-backend:
# checks if the server is running on Linux or Windows 
ifeq ($(OS),Linux)
	@echo "Detected Linux"
	make check-db-linux
	cd backend && npm start
else
	@echo "Detected Windows"
	make check-db-windows
	cd backend && npm start
endif

start-frontend:
	cd frontend && npm start

start-all:
	make -j2 start-backend start-frontend

# Check database status for Linux
check-db-linux:
	@echo "Checking database status on Linux..."
	if ! systemctl is-active --quiet mysql; then \
		echo "Starting MySQL service..."; \
		sudo systemctl start mysql; \
	fi
	@echo "MySQL service is running."

# Check database status for Windows
check-db-windows:
	@echo "Checking database status on Windows..."
	@if !(Get-Service | Where-Object { $_.Name -eq "MySQL" -and $_.Status -eq "Running" }) { \
		Write-Output "Starting MySQL service..."; \
		Start-Service MySQL; \
	}
	@echo "MySQL service is running."

[
  {
    "essential": true,
    "memory": 256,
<<<<<<< HEAD
    "name": "nodejsapp",
=======
    "name": "nodejs_app",
>>>>>>> 1759cc550b493b9d7bc567c158c935ea0c4aa6d6
    "cpu": 256,
    "image": "${REPOSITORY_URL}:${APP_VERSION}",
    "workingDirectory": "/app",
    "command": ["npm", "start"],
    "portMappings": [
        {
            "containerPort": 3000,
            "hostPort": 3000
        }
    ]
  }
]


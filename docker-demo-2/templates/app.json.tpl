[
  {
    "essential": true,
    "memory": 256,
    "name": "nodejs-app",
    "cpu": 256,
    "image": "${REPOSITORY_URL}:1",
    "portMappings": [
        {
            "containerPort": 3000,
            "hostPort": 3000
        }
    ]
  }
]


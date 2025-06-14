from pydantic import BaseSettings


# Any of these can be overridden via environment variables with matching names
class Settings(BaseSettings):
    # GitHub container registry and organization name, used for "registry/org/image" -name generation
    DOCKER_USER = "ghcr.io/ioxiocom"

    LOCAL_REGISTRY = "localhost:5000"

    # List of images that should be built beforehand
    PRIORITY_BUILDS = [
        [
            "ubuntu-base/24.04",
            "nginx-base/alpine-nginx",
        ],
        [
            "python-base/ubuntu24.04-python3.13",
        ],
        [
            "python-base/ubuntu24.04-python3.13-nginx",
        ],
    ]


conf = Settings()

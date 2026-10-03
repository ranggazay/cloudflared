variable "CLOUDFLARED_VERSION" {
    default = "2026.9.3"
}

variable "LATEST" {
    default = true
}

variable "MULTI_PLATFORM" {
    default = false
}

variable "GOVERSION" {
    default = "1.27.1"
}

variable "ALPINEVERSION" {
    default = "3.24.2"
}

target "default" {
    args = {
        VERSION = CLOUDFLARED_VERSION
        GOVERSION = GOVERSION
        ALPINEVERSION = ALPINEVERSION
    }
    platforms = !MULTI_PLATFORM ? null : [
        "linux/amd64",
        "linux/386",
        "linux/arm64",
        "linux/arm/v7",
        "linux/arm/v6",
        "linux/s390x",
        "linux/ppc64le",
        "linux/riscv64"
    ]
    tags = [
        "ranggazay/cloudflared:${CLOUDFLARED_VERSION}",
        "ghcr.io/ranggazay/cloudflared:${CLOUDFLARED_VERSION}",
        LATEST ? "ranggazay/cloudflared:latest" : "",
        LATEST ? "ghcr.io/ranggazay/cloudflared:latest" : "",
    ]
}

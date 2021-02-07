job "j-word-counter" {

    datacenters = ["dc1"]

    group "g-word-counter" {

        count = 5

        task "t-word-counter" {

            driver = "docker"

            config {
                image = "ghcr.io/carlosost/word_counter/word_counter:latest"
            }

            resources {
                network {
                    mbits = 10
                    port "http" {}
                }
            }

            service {
                name = "word-counter"
                port = "http"
                
                tags = [
                    "macbook",
                    "urlprefix-/word-counter",
                ]

                check {
                    type     = "http"
                    path     = "/health"
                    interval = "2s"
                    timeout  = "2s"
                }
            }
        }
    }
}